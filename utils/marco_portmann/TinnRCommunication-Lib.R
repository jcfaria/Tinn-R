#! Read help files

GetArgText <- function(obj)
{
  argtext <- ""
  if ( (class(obj)[1] %in% c("function", 'nonstandardGenericFunction')))
  {
    if (length(formals(obj))>0)
    {
    arglist <- list()
    form <- formals(obj)
  
    for (i in 1:length(form))
    {
      if ( is.null(form[i][[1]]) == F && (!is.na(as.character(form[i][[1]]))) && (nchar(as.character(form[i][[1]]))>0)  ){
        arglist <- c(arglist, paste(names(form[i]), " = ", as.character(form[i][[1]]), sep =""))
      }else  arglist <- c(arglist, names(form[i]) )   
    }
    argtext <- paste(arglist, collapse = ", " )
    if (length(form) == 0 && is.null(form) )
      argtext <- NULL
    return(argtext)
    } else return(argtext)
  } else return(NULL)   
}  
  
HelpRawHtml <- function(topic, pkg_ref  = NULL , format=c("text", "html", "latex", "Rd"))
{   
  format=match.arg(format)
  if (!is.character(topic)) topic <- deparse(topic) 
  if (require(pkg_ref, character.only=T)==T){  
    htopic <- help((topic), (pkg_ref))
    if (length(htopic)==1)
    { 
      helpfile = utils:::.getHelpFile(htopic)
      hs <- capture.output( tools:::Rd2HTML(helpfile)  )
      hs <- paste(hs, collapse="")
      return(hs)
    }else return("") 
  }else return("") 
}


HelpItems <- function(topic, pkg_ref  = NULL)
{
  rawtext <- HelpRawHtml(topic, pkg_ref, format ='html')
  TitleResults <- regmatches(rawtext, gregexpr("(?<=<h2>).*?(?=</h2>)", rawtext, perl=T))
  if (length(TitleResults)== 1) Title <- TitleResults[[1]] else Title <- ""
  DescriptionResults <- regmatches(rawtext, gregexpr("(?<=Description</h3><p>).*?(?=</p><h)", rawtext, perl=T))
  if (length(DescriptionResults)== 1) Description <- DescriptionResults[[1]] else Description <- ""
  return(list(Title, Description))
}




#!trObjList3 

trObjList3 <- function(
                             id='default',
                             envir=.GlobalEnv,
                             all.names=TRUE,
                             sep='\t',
                             
                             PrettyName = NA
                            )
{
  # Make sure that id is character
  id <- as.character(id)[1]
  if(id == '') id <- 'default'

  # Format envir as character (use only first item provided!)
  if(is.environment(envir))
    envir <- deparse(substitute(envir))

  if(is.numeric(envir))
    envir <- search()[envir[1]]

  envir <- as.character(envir)[1]

  # Get the current position in the search path for envir
  pos <- match(envir,
               search(),
               nomatch=-1)

  if(pos < 1){
    # NOT FOUND, return nothing
    pos <- 1
  # Environment found
  }else {
    # Get the list of objects in this environment
    Items <- ls(pos=pos,
                all.names=all.names)

    if(length(Items) == 0)
        return(data.frame(Envir=character(),
                          DisplayName      = character(),
                          Name             = character(),
                          InsertText       = character(),
                          Description      = character(),
                          DescriptionFormatted=character(), 
                          Title            = character(),
                          Dim              = character(),
                          Group            = character(),
                          Class            = character(),
                          Arguments        = character(),
                          HasArguments     = numeric(),
                          Recusive         = logical(),
                          stringsAsFactors = FALSE))

    # Get characteristics of all objects
    describe <- function(name, pos='.GlobalEnv', all.info=FALSE)
    {
      # get a vector with five items:
      # Name, Dims, Group, Class and Recursive
      obj <- get(name, pos=pos)
      ArgText <- GetArgText(obj)
      if (is.null(ArgText))
      {
        ArgText <- ''
        HasArg  <- 0
        InsText <- name
      }else{
        HasArg  <- 1
        InsText <- paste(name, '(', ArgText, ')', sep = '')            
      }
      HI <- HelpItems(name, PrettyName)
      Ti <- HI[[1]]
      Descr <- HI[[2]]
      if (length(Descr)>1) Descr <- Descr[[1]]
     
      
      if (length(Ti)==0) Ti <- ''
      if (length(Descr)==0) Descr <- ''      
      res <- c(
               DisplayName = name,
               Name        = name,
               InsertText  = InsText,
               Description = Descr,
               DescriptionFormatted = paste('<p><b>', Ti, '</b></p>', Descr, sep = ''),
               Title       = Ti, 
               Dims        = if(is.null(Dim <- dim(obj)))
                               length(obj)
                             else
                               paste(Dim, collapse='x'),
               Group       = typeof(obj),
               Class       = class(obj)[1],
               Arguments   = ArgText, 
               HasARguments=HasArg, 
               Recursive   = !inherits(obj, 'function') && is.recursive(obj))

      return(res)
    }
                               
    res <- data.frame(t(sapply(Items,
                               describe,
                               pos=envir
                               )),
                      stringsAsFactors=FALSE)

    # Recalculate groups into meaningful ones for the object explorer
    # 1) Correspondance of typeof() and group depicted in the browser
    GrpTable <- c(
      'NULL',      'language',  'list',        'function',  'language',
      'language',  'language',  'function',    'function',  'language',
      'logical',   'numeric',   'numeric',     'complex',   'character',
      'language',  'language',  'language',    'list',      'language',
      'S4',        'language',  'raw',         'language')

    names(GrpTable) <- c(
      'NULL',      'symbol',    'pairlist',    'closure',   'environment',
      'promise',   'language',  'special',     'builtin',   'char',
      'logical',   'integer',   'double',      'complex',   'character',
      '...',       'any',       'expression',  'list',      'bytecode',
      'S4',        'weakref',   'raw',         'externalptr')

    Groups <- GrpTable[res$Group]

    # 2) All Groups not being language, function or S4 whose class is
    #    different than typeof are flagged as S3 objects
    Filter <- !(Groups %in% c('language', 'function', 'S4'))
    Groups[Filter][res$Group[Filter] != res$Class[Filter]] <- 'S3'

    # 3) Special case for typeof=double and class=numeric
    Groups[res$Group == 'double'] <- 'numeric'

    # 4) integers of class factor become factor in group
    Groups[res$Class == 'factor'] <- 'factor'

    # 5) Objects of class 'data.frame' are also group 'data.frame'
    Groups[res$Class == 'data.frame'] <- 'data.frame'

    # 6) Objects of class 'Date' or 'POSIXt' are of group 'DateTime'
    Groups[res$Class == 'Date'] <- 'DateTime'
    Groups[res$Class == 'POSIXt'] <- 'DateTime'

    # Reaffect groups
    res$Group <- Groups

    # Transform into a character vector
    res2<- apply(res,
                 1,
                 paste,
                 collapse=sep)
  }

  if( !exists('res2') || (length(res2) == 1 && res2 == ''))
    res <- data.frame(as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.character(),
                      as.numeric(),
                      as.numeric(),
                      stringsAsFactors=FALSE)
  
  res <- res[, -ncol(res)]
  colnames(res) <- c(
                     'DisplayName',
                     'Name',       
                     'InsertText', 
                     'Description',
                     'DescriptionFormatted',
                     'Title',      
                     'Dim',        
                     'Group',      
                     'Class',      
                     'Arguments',
                     'HasArguments'
                    )
  rownames(res) <- NULL

  # Group conversion to current necessity of Tinn-R
  trTable <- c(
    'vector',   'vector',    'vector',     'vector',
    'vector',   'vector',    'vector',     'data.frame',
    'list',     'function',  'other',      'other',
    'other',    'other')

  names(trTable) <- c(
    'numeric',  'complex',   'character',  'logical',
    'factor',   'DateTime',  'raw',        'data.frame',
    'list',     'function',  'NULL',       'language',
    'S3',       'S4')

  trGroup <- trTable[res$Group]
  trGroup[res$Class == 'matrix'] <- 'matrix'
  trGroup[res$Class == 'array']  <- 'array'
  trGroup[res$Class == 'table']  <- 'table'
  trGroup[res$Class == 'mts']    <- 'other'
  res$Group <- trGroup

  
  if (nrow(res)> 0)
    {res <- cbind(res, envir = as.character(envir), PrettyPackage = as.character(PrettyName))
    }else{ res <- cbind(res, envir = as.character(), PrettyPackage = as.character()) }
  return(res)
}



#! Check required packages

  CheckRequiredPackages <- function()
  {
    packagelist <- c()
    if (require('RSQLite',character.only = T, quietly = T)==F) packagelist <- c(packagelist, 'RSQLite')
    if (require('svSocket',character.only = T, quietly = T)==F) packagelist <- c(packagelist, 'svSocket')
    if (require('formatR',character.only = T, quietly = T)==F) packagelist <- c(packagelist, 'formatR')
    #if (require('BlingBling',character.only = T, quietly = T)==F) packagelist <- c(packagelist, 'BlingBling')
    return(packagelist)
  }

packagelist <- CheckRequiredPackages()

if (length(packagelist)>0)
{
  options(repos = c(CRAN = "http://cran.rstudio.com"))
  install.packages(packagelist)

  packagelist <- CheckRequiredPackages()
 if (length(packagelist)>0)
    stop(paste('TinnRMSG::MissingPackage:',packagelist,'<',  sep=''))
}


#LibraryPath <-  "C:\\Users\\Marco\\AppData\\Roaming\\Tinn-R\\data\\RHelpSystem - Copy.txt"


AllInstalled <- installed.packages()


  tryCatch(
            {
             try(             
                 {
                 TinnRSQLite    <- dbDriver("SQLite")
                 TinnRSQLiteConnection  <- dbConnect(TinnRSQLite, LibraryPath)
                 if (dbExistsTable(TinnRSQLiteConnection, "Packages"))
                 {  
                  TinnPackages <- dbReadTable(TinnRSQLiteConnection, "Packages")
                  dbDisconnect(TinnRSQLiteConnection) 
                  FullList <- merge(AllInstalled, TinnPackages[, c('Package', 'TinnVersion', 'LibPath')], by = c('Package', 'LibPath'),all.x =T)
                  FullList <- rbind(FullList, subset(TinnPackages, Package %in% FullList$Package == F))                     
                  TinnRSQLiteConnection  <- dbConnect(TinnRSQLite, LibraryPath)
                  y <- dbSendQuery(TinnRSQLiteConnection, "DELETE FROM Packages")
                  dbWriteTable(TinnRSQLiteConnection, "Packages", FullList, append = T)
                  }}, silent = T
                )
            }, finally = {dbDisconnect(TinnRSQLiteConnection)}   
            
            )

  
  if (!exists('FullList'))
   stop()

  FullList <- unique(FullList[, c('Package', 'Version', 'TinnVersion')])
  
  lcount <- tapply(FullList$Version, factor(FullList$Package), length)
  lcount <- lcount[lcount>1] 
  if (length(lcount)>0)
    for (pname in names(lcount))
    {
      #pname <- names(lcount)[3]
      #library(as.character(pname), character.only = T)
      pver <- packageVersion(pname)
      FullList <- FullList[(FullList$Package != pname) | (FullList$Package == pname & as.character(FullList$Version) == pver) ,]
    }
  
 
  tryCatch(
           {
            dim(FullList)
            IsUpdating <- F                    
            
            NeedsUpd <- subset(FullList, (Version != TinnVersion) | is.na(TinnVersion) )
                  for (i in 1:nrow(NeedsUpd))
                  {        
                   
                   # Check it again...
                   # If a package is installed in two locations and they both have the same version
                   # it has to be imported only once.                   
                   # Consider to refactor that... Why not delete one location from the table before starting the
                   # loop.

                   if (is.na( NeedsUpd[i, 'TinnVersion']) | NeedsUpd[i, 'Version'] != NeedsUpd[i, 'TinnVersion'])
                   {
                     if (!IsUpdating)
                      {
                        IsUpdating <- T
                        print('!!TinnRMSG:LibraryUpdating<')
                      }
                      
                      PrettyName <- as.character(NeedsUpd[i, 'Package'])
                      Envir <- paste('package:', PrettyName, sep ='')
                      #library(as.character(PrettyName), character.only = T)
                      if (require(as.character(PrettyName),character.only = T, quietly = T)==T)
                      {
                        print(paste("!!TinnRMSG:Adding package:",PrettyName, "<", sep = ""))
                        cont <- trObjList3(envir = Envir,  PrettyName = PrettyName)  
                        TinnRSQLiteConnection  <- dbConnect(TinnRSQLite, LibraryPath)
                        dbSendQuery(TinnRSQLiteConnection, paste("DELETE FROM Objects WHERE Envir =", dQuote(Envir),sep = ""))
                        if (nrow(cont)>0)
                          dbWriteTable(TinnRSQLiteConnection, "Objects", cont, append = T)
                        
                        dbSendQuery(TinnRSQLiteConnection, paste("UPDATE Packages SET TinnVersion = ", dQuote(as.character(NeedsUpd[i, 'Version'])), ' WHERE Package =', dQuote(PrettyName ), sep = ""))
                        dbDisconnect(TinnRSQLiteConnection)
                        FullList[FullList$Package == PrettyName, 'TinnVersion'] <- as.character(NeedsUpd[i, 'Version'])
                    }
                   } 
                  } 
           }, finally = {print(paste("!!TinnRMSG:Library updated<", sep = ""))}
          
          )
  IsUpdating <- F

