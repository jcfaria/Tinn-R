
err.txt <- ""
if (require("RSQLite",character.only = T, quietly = F)==F) err.txt <- paste(err.txt, "RSQLite", sep='|')
if (require("svSocket",character.only = T, quietly = F)==F) err.txt <- paste(err.txt, "svSocket", sep='|')
if (require("formatR",character.only = T, quietly = F)==F) err.txt <- paste(err.txt, "formatR", sep='|')   

if (nchar(err.txt)>0) stop(paste('TinnRMSG:MissingPackage:',err.txt,'<',  sep=''))
rm(err.txt)


#! Tidy Wrapper

TinnR$TinnRTidy <- function(sourcefile, targetfile)
{
  tryCatch({tidyDone <- F; tidy.source(source = sourcefile, file = targetfile); tidyDone <- T},
           finally = {if (tidyDone) print('TinnRMSG:TidyReady') else print('TinnRMSG:TidyFailed')}
          )           
}   


#! trObjInfo

TinnR$trObjInfo <-
function (id, path, sep = "\t", CallID = 1)
{

    describe <- function(name, parent) {
        sobj <- parent[name]
        res <- c(Name = name, Dims = if (is.null(Dim <- dim(sobj))) length(sobj) else paste(Dim,
            collapse = "x"), Class = class(sobj[[1]]))
        return(res)
    }

    res <- c()
    id <- as.character(id)#[1]
    if (exists(as.character(id))==F)
    {
      try({obj <- eval(parse(text=id))
           Items <- names(obj)
           if (length(Items) != 0)
           res <- data.frame(t(sapply(Items, describe, parent = obj)))
          }, silent=TRUE)
    }else{   
    #if (exists(id)){
        obj <- get(id)
        Items <- names(obj)
        
        if (length(Items) != 0)
           res <- data.frame(t(sapply(Items, describe, parent = obj)))

    }
    write.table(res, file = path, row.names = FALSE, col.names = FALSE, quote = FALSE, sep =sep)
    print(paste('TinnRMSG:ObjectInfo:', CallID, '<',  sep ='' ))
}

#! trArgs

TinnR$trArgs <- function(fname,
                   txt='',
                   pkg='',
                   classfor,
                   sep='|')
{

  # Function to format output
  format.out <- function(arg,
                         pk,
                         fname)
  {
    return(paste(arg,
                 ' [',
                 pk,
                 ']',
                 '<',
                 fname,
                 '>',
                 sep=''))
  }

  # Args from primitives
  primitive.args <- function(x)
  {
    fun <- get(x)
    f <- capture.output(args(x))

    f <- sub(') $',
             '',
             sub('^function \\(',
                 '',
                 f[1]))

    f <- strsplit(f,
                  ',')[[1]]

    f <- sub('^ ',
             '',
             f)

#    f <- sub('=',
#             '\x07',
#             f)

    paste(f,
          collapse=sep)
  }
  
  # Get package for not exported function
  get.hidden <- function(fname)
  {
    res <- getAnywhere(fname)

    res <- grep('namespace:',
                res$where,
                value=TRUE)

    res <- gsub('namespace:',
                '',
                res)

    return(res)
  }

  # Main
  frm <- NA
  fmeth <- NA

  try(classfor <- eval(parse(text=classfor)),
      silent=TRUE)

  if(!missing(classfor)) {
    if(length(grep(fname,
                   names(.knownS3Generics))) > 0) {
      curwarn <- getOption('warn')

      options(warn=-1)

      #if(exists(as.character(substitute(classfor))))
      #  if(is.character(classfor))
      #    classfor <- eval(parse(text=classfor))

      try(classfor <- classfor,
          silent=TRUE)  # classfor may be a function

      try(.theclass <- class(classfor),
          silent=TRUE)

      options(warn=curwarn)

      if(exists('.theclass')) {
        for(i in 1:length(.theclass)) {
          fmeth <- paste(fname,
                         '.',
                         .theclass[i],
                         sep='')

          if (length(argsAnywhere(fmeth))) {
            fname <- fmeth

            frm <- formals(argsAnywhere(fmeth))

            break
          }
        }
      }
    }
  }

  if(is.na(frm[1])) {
    if(pkg == '') {
      deffun <- paste(fname,
                      '.default',
                      sep='')

      if (existsFunction(deffun)) {
        fname <- deffun

        fmeth <- deffun
      } else if(!existsFunction(fname)) {
        return(format.out('Object not found',
                          'Loaded packages',
                          fname))
      }

      if(is.primitive(get(fname))) {
        pkname <- find(fname,
                       mode='function')

        if(length(pkname) > 0)
          info <- gsub('package:',
                       '',
                       pkname[1])

        return(format.out(primitive.args(fname),
                          info,
                          fname))
      }
      else {
        fmeth <- fname

        frm <- formals(fmeth)
      }
    } else {
      idx <- grep(paste(':',
                        pkg,
                        '$',
                        sep=''),
                  search())

      ff <- 'NULL'

      tr <- try(ff <- get(paste(fname,
                                '.default',
                                sep=''),
                          pos=idx),
                silent=TRUE)

      if(class(tr)[1] == 'try-error')
        ff <- get(fname,
                  pos=idx)

      frm <- formals(ff)
    }
  }

  res <- NULL

  for (field in names(frm))
    if (field != '...')
      res <- append(res,
                    paste(field,
                          deparse(frm[[field]]),
                          sep='='))
    else
      res <- append(res,
                    field)

  res <- grep(paste('^',
                    txt,
                    sep=''),
              res,
              value=TRUE)

  res <- paste(res,
               collapse=sep)

  if(length(res) == 0 ||
       res == '') {
    res <- 'NO_ARGS'
  } else {
    if(pkg == '') {
      pkname <- find(fname,
                     mode='function')

      if(!length(pkname))
        pkname <- get.hidden(fname)
      
      info <- NA
      if(length(pkname) > 0)
        info <- gsub('package:',
                     '',
                     pkname[1])

      if(!is.na(info) &&
           !is.na(fmeth)) {
        return(format.out(res,
                          info,
                          fmeth))
      }
    }
  }

  return(format.out(res,
                    pkg,
                    fname))
}

#! trComplete 


TinnR$trComplete <- function (code,
                        pattern='',
                        sep = '\t')
{
  # Get package
  get.pkg <- function(fname)
  {
    res <- getAnywhere(fname)

    res <- grep('package:',
                res$where,
                value=TRUE)

    pkg <- gsub('package:',
                '',
                res)

    return(pkg)
  }

  # Get object
  get.object <- function(string)
  {
    pos <- regexpr('[a-zA-Z0-9_\\.]+$',
                   string)

    object <- substring(string,
                        pos)

    return(object)
  }

  object <- get.object(code)

  pkg <- get.pkg(object)

  res <- .DollarNames(eval(as.name(object)),
                      pattern)
  
  res <- paste(paste(paste(res, 
                           sep, 
                           sep=''), 
                     collapse=''),
               '[',
               pkg,
               ']',
               '<',
               object,
               '>',
               sep='')                                 
}  
  
  
#!trExport 

TinnR$trExport <- function(x,
                     type='raw',
                     file='clipboard')
{
  # R2HTML package
  # HTML sub-function
  exportHTML <- function(x,
                         file)
 {
   ifelse(file != '',
          tmpfile <- file(file,
                          open='w'),
          tmpfile <- file)

   HTML(x,
       file=tmpfile)

   if(file != '')
     close(tmpfile)

   invisible(return(TRUE))
 }

  # Hmisc package
  # LaTeX sub-function
  exportLaTeX <- function(x,
                          file)
  {
    ifelse(file != '',
           tmpfile <- file(file,
                           open='w'),
           tmpfile <- file)

    latex(x,
         file=tmpfile)

    if(file != '')
      close(tmpfile)

    invisible(return(TRUE))
  }

  # ASCII sub-function
  exportASCII <- function(x,
                          file)
  {
    treated <- FALSE
    if(is.vector(x)) {
      txt <- paste(x,
                   collapse = '\t')
      treated <- TRUE
    }
    if(is.matrix(x)) {
      txt <- as.character(x)

      txt <- paste(apply(x,
                         1,
                         FUN=paste,
                         collapse='\t'),
                   collapse='\n')

      treated <- TRUE
    }
    if(!treated) {
      tmpfile <- tempfile()

      sink(tmpfile)

      print(x)

      sink()

      txt <- readLines(tmpfile)

      txt <- paste(txt,
                   collapse='\n')
    }

    ifelse(file != 'clipboard',
           tmpfile <- file(file,
                           open='w'),
           tmpfile <- file)

    cat(txt,
        file=tmpfile)

    if(file != 'clipboard')
      close(tmpfile)

    invisible(return(TRUE))
  }

  # RAW sub-function
  exportRaw <- function(x,
                        file)
  {
    ifelse(file != 'clipboard',
           tmpfile <- file(file,
                           open='w'),
           tmpfile <- file)

    dput(x,
         file=tmpfile)

    if(file != 'clipboard')
      close(tmpfile)

    invisible(return(TRUE))
  }

  # Compute the expression
  if(is.expression(x))
     xexp <- x
  else
    xexp <- NULL

  if(!is.expression(xexp) ||
     is.null(xexp)) {
    xexp <- substitute(x)

    # To make sure that non conventional names will be correctly evaluated, we use backticks!
    if(is.character(xexp))
      xexp <- parse(text=paste('`',
                    xexp,
                    '`',
                    sep=''))

    xexp <- as.expression(xexp)
  }

  # Process the command in the standard function 
  x <- eval(xexp,
            envir=.GlobalEnv)

  res <- switch(type,
    'typelist'= unique(c('raw',
                         'ascii',
                         'html',
                         'latex')),
    exportRaw(x,
              file),

    'ascii' = exportASCII(x,
                          file),

    'html' = exportHTML(x,
                        file),

    'latex' = exportLaTeX(x,
                          file))

  ifelse(type == 'typelist',
         return(res),
         invisible(res))
}

#!trObjList 

TinnR$trObjList <- function(id='default',
                      envir=.GlobalEnv,
                      all.names=TRUE,
                      pattern='',
                      group='',
                      all.info=FALSE,
                      sep='\t',
                      path=NULL)
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

  if(pos < 1)
    # NOT FOUND, return nothing
    pos <- 1
  # Environment found
  else {
    # Get the list of objects in this environment
    Items <- ls(pos=pos,
                all.names=all.names,
                pattern=pattern)

    if(length(Items) == 0)
      if(all.info)
        return(invisible(data.frame(Name=character(),
                                    Dims=character(),
                                    Group=character(),
                                    Class=character(),
                                    Recusive=logical(),
                                    stringsAsFactors=FALSE)))
      else
        return(data.frame(Envir=character(),
                          Name=character(),
                          Dims=character(),
                          Group=character(),
                          Class=character(),
                          Recusive=logical(),
                          stringsAsFactors=FALSE))

    # Get characteristics of all objects
    'describe' <- function(name,
                           pos='.GlobalEnv',
                           all.info=FALSE) {
      # get a vector with five items:
      # Name, Dims, Group, Class and Recursive
      obj <- get(name,
                 pos=pos)
      res <- c(Name=name,
               Dims=if(is.null(Dim <- dim(obj)))
                      length(obj)
                    else
                      paste(Dim, collapse='x'),
               Group=typeof(obj),
               Class=class(obj)[1],
               Recursive=!inherits(obj,
                                   'function') && is.recursive(obj))
      if(all.info)
        res <- c(Envir=pos,
                 res)
      return(res)
    }

    res <- data.frame(t(sapply(Items,
                               describe,
                               pos=envir,
                               all.info=all.info)),
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
    res <- apply(res,
                 1,
                 paste,
                 collapse=sep)
  }

  if(length(res) == 1 && res == '')
    res <- data.frame('',
                      '',
                      '',
                      '',
                      stringsAsFactors=FALSE)
  else
    res <- data.frame(t(data.frame(strsplit(res, '\t'))),
                      stringsAsFactors=FALSE)[ , -5]

  colnames(res) <- c('Name',
                     'Dim',
                     'Group',
                     'Class')
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

  # Filter
  if(group != '')
    if (group == 'data')
      res <- res[trGroup != 'function', ]
    else
      res <- res[trGroup == group, ]

  # Final result
  if(is.null(path))
    return(res)
  else
    write.table(res,
                file=path,
                row.names=FALSE,
                quote=FALSE,
                sep ='\t')
}

#!trObjSearch

TinnR$trObjSearch <- function(sep='\t',
                        path=NULL)
{
  res <- data.frame(search())
  if(is.null(path))
    return(res)
  else
    write.table(res,
                file=path,
                row.names=FALSE,
                quote=FALSE,
                sep=sep)
}


#! .onload


#TinnR$.onLoad <- function(libname, 
#                    pkgname)

#! TinnREnvList

TinnR$TinnREnvList <- ""


TinnR$trEnvironmentUpdate <- function()
{
  res <- search()
  if ( (length(TinnR$TinnREnvList) != length(res))  || ((res != TinnR$TinnREnvList)>1) )
  {
    TinnR$TinnREnvList <- search()
    print(paste(c('!!update!!', (res)), collapse=','))
  
  }else return()
  
}

#! TinnRExplorer
#invisible(
# capture.output(cat("Hi\n"), file='NULL',{
#  require(RSQLite)   ;
#
#
#TinnR$TinnRSQLite    <- dbDriver("SQLite")
#})
#         )
#

invisible(
 capture.output( file=NULL,{
                            require(RSQLite)   ;
                            TinnR$TinnRSQLite    <- dbDriver("SQLite")
                           }
               )
         )



#TinnR$TinnRSQLiteConnection  <- dbConnect(TinnR$TinnRSQLite,TinnR$.trPaths[11])



TinnR$TinnRExpList <- data.frame(Name=character(),
                                 Dim=character(),
                                 Group=character(),
                                 Class=character(),
                                 envir=character(),
                                 stringsAsFactors=FALSE)


TinnR$TinnRExplorer <- function(envir = .GlobalEnv, ForceUpdate = F, CurrentVersion = NULL){


  if(is.environment(envir))
    envir <- deparse(substitute(envir))

  if(is.numeric(envir))
    envir <- search()[envir[1]]

  envir <- as.character(envir)[1]


  upd <- TinnR$trObjList2(envir = envir)  
  old <- TinnR$TinnRExpList[TinnR$TinnRExpList$envir == envir,] 

  DoUpdate <- ForceUpdate
  
  if (is.null(CurrentVersion) == F)
    if(CurrentVersion<TinnR$ExplorerCounter)  DoUpdate <- T 
  
  
  if (DoUpdate == F)
  {
    if (nrow(upd) == nrow(old))
    {
        if(sum(old[,-5] != upd[, -5])>0) DoUpdate <- T
    }else DoUpdate <- T
  }
  if (DoUpdate){
    TinnR$TinnRExpList <- TinnR$TinnRExpList[TinnR$TinnRExpList$envir != envir,]
    TinnR$TinnRExpList <- data.frame(rbind(TinnR$TinnRExpList, upd), stringsAsFactors = F)
    
    tryCatch(
    {
      TinnR$TinnRSQLiteConnection  <- dbConnect(TinnR$TinnRSQLite,TinnR$.trPaths[11])
      if (dbExistsTable(TinnR$TinnRSQLiteConnection, "Objects"))
        dbRemoveTable(TinnR$TinnRSQLiteConnection, "Objects")
      dbWriteTable(TinnR$TinnRSQLiteConnection, "Objects", TinnR$TinnRExpList, field.types=list(Name ="varchar(100)", Dim = "varchar(100)", Group = "varchar(100)", Class ="varchar(100)", Envir = "varchar(100)"), row.names=FALSE)
    }, finally ={dbDisconnect(TinnR$TinnRSQLiteConnection)}
    )
    TinnR$ExplorerCounter <- TinnR$ExplorerCounter +1 
    print(paste('TinnRMSG:update:', envir, '<', TinnR$ExplorerCounter, '<',  sep ='' ))
  }else print(paste('TinnRMSG:noupdate:', TinnR$ExplorerCounter, '<',  sep ='' ))
}



#!trObjList2 

TinnR$trObjList2 <- function(id='default',
                      envir=.GlobalEnv,
                      all.names=TRUE,
                      pattern='',
                      group='',
                      sep='\t',
                      all.info=FALSE
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

  if(pos < 1)
    # NOT FOUND, return nothing
    pos <- 1
  # Environment found
  else {
    # Get the list of objects in this environment
    Items <- ls(pos=pos,
                all.names=all.names,
                pattern=pattern)

    if(length(Items) == 0)
      if(all.info)
        return(invisible(data.frame(Name=character(),
                                    Dim=character(),
                                    Group=character(),
                                    Class=character(),
                                    Recusive=logical(),
                                    stringsAsFactors=FALSE)))
      else
        return(data.frame(Envir=character(),
                          Name=character(),
                          Dims=character(),
                          Group=character(),
                          Class=character(),
                          Recusive=logical(),
                          stringsAsFactors=FALSE))

    # Get characteristics of all objects
    'describe' <- function(name,
                           pos='.GlobalEnv',
                           all.info=FALSE) {
      # get a vector with five items:
      # Name, Dims, Group, Class and Recursive
      obj <- get(name,
                 pos=pos)
      res <- c(Name=name,
               Dims=if(is.null(Dim <- dim(obj)))
                      length(obj)
                    else
                      paste(Dim, collapse='x'),
               Group=typeof(obj),
               Class=class(obj)[1],
               Recursive=!inherits(obj,
                                   'function') && is.recursive(obj))
      if(all.info)
        res <- c(Envir=pos,
                 res)
      return(res)
    }

    res <- data.frame(t(sapply(Items,
                               describe,
                               pos=envir,
                               all.info=all.info)),
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
    res <- apply(res,
                 1,
                 paste,
                 collapse=sep)
  }

  if(length(res) == 1 && res == '')
    res <- data.frame('',
                      '',
                      '',
                      '',
                      stringsAsFactors=FALSE)
  else
    res <- data.frame(t(data.frame(strsplit(res, '\t'))),
                      stringsAsFactors=FALSE)[ , -5]

  colnames(res) <- c('Name',
                     'Dim',
                     'Group',
                     'Class')
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

  # Filter
  if(group != '')
    if (group == 'data')
      res <- res[trGroup != 'function', ]
    else
      res <- res[trGroup == group, ]

  res <- cbind(res, envir = as.character(envir))
  # Final result
  return(res)
}


#! GetArgText

TinnR$GetArgText <- function(obj)
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
      if ( is.null(form[i][[1]]) == F && (nchar(as.character(form[i][[1]]))>0)  ){
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
  
TinnR$HelpRawHtml <- function(topic, pkg_ref  = NULL , format=c("text", "html", "latex", "Rd"))
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


TinnR$HelpItems <- function(topic, pkg_ref  = NULL)
{
  rawtext <- TinnR$HelpRawHtml(topic, pkg_ref, format ='html')
  TitleResults <- regmatches(rawtext, gregexpr("(?<=<h2>).*?(?=</h2>)", rawtext, perl=T))
  if (length(TitleResults)== 1) Title <- TitleResults[[1]] else Title <- ""
  DescriptionResults <- regmatches(rawtext, gregexpr("(?<=Description</h3><p>).*?(?=</p><h)", rawtext, perl=T))
  if (length(DescriptionResults)== 1) Description <- DescriptionResults[[1]] else Description <- ""
  return(list(Title, Description))
}



#!trObjList3 

TinnR$trObjList3 <- function(
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

  if(pos < 1)
    # NOT FOUND, return nothing
    pos <- 1
  # Environment found
  else {
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
    describe <- function(name,
                           pos='.GlobalEnv',
                           all.info=FALSE
                           )
    {
      # get a vector with five items:
      # Name, Dims, Group, Class and Recursive
      obj <- get(name,
                 pos=pos)
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


#! TinnRLibraryUpdate

#TinnR$TinnRLibraryUpdate <- function(Cycle = 1){
#    NoError <- F
#    tryCatch(
#    {
#      TinnR$TinnRSQLiteConnection  <- dbConnect(TinnR$TinnRSQLite,TinnR$.trPaths[12])
#      if (dbExistsTable(TinnR$TinnRSQLiteConnection, "Environments"))
#      {
#        envs <- dbReadTable(TinnR$TinnRSQLiteConnection, "Environments")
#        dbDisconnect(TinnR$TinnRSQLiteConnection)
#        for (i in 1:nrow(envs))
#        {
#          if (envs[i, "CheckUpdate"] == 1)
#          {          
#            PrettyName <- regmatches(envs[i, "Environment"] , gregexpr("(?<=package:).*", envs[i, "Environment"] , perl=T))[[1]]
#            if (length(PrettyName)==0)  PrettyName <- envs[i, "Environment"] 
#            
#            if (require(PrettyName,character.only = T)==T)
#            {
#              PackDescr <- packageDescription(PrettyName)
#              if (length(PackDescr)>1)
#              {
#                Version     <- PackDescr$Version
#                Description <- PackDescr$Description
#                require(PrettyName, character.only = TRUE)
#              }else{Version <- NA; PrettyName <- envs[i, "Environment"]; Description <- ""}
#            }else{Version <- NA; PrettyName <- envs[i, "Environment"]; Description <- ""}
#            # To do: message should be printed and shown while function is still running not buffered at the end
#            print(paste("!!TinnRMSG:Adding package ''",PrettyName, "' to the library. Please wait...", sep = ""))
#            
#            cont <- TinnR$trObjList3(envir = envs[i, "Environment"], PrettyName = PrettyName)  
#            TinnR$TinnRSQLiteConnection  <- dbConnect(TinnR$TinnRSQLite,TinnR$.trPaths[12])
#            dbSendQuery(TinnR$TinnRSQLiteConnection, paste("DELETE FROM Objects WHERE Envir =", dQuote( envs[i, "Environment"]),sep = ""))
#            dbWriteTable(TinnR$TinnRSQLiteConnection, "Objects", cont, append = T)
#            dbSendQuery(TinnR$TinnRSQLiteConnection, paste("UPDATE Environments SET CheckUpdate = 0, Version =",dQuote(Version)," WHERE Environment =", dQuote( envs[i, "Environment"]),sep = ""))
#            dbDisconnect(TinnR$TinnRSQLiteConnection)
#          }          
#        }       
#     }  
#     NoError <- T
#     
#    }, finally ={dbDisconnect(TinnR$TinnRSQLiteConnection)
#                 print('!!update!!')
#                 Cycle <- Cycle + 1
#                 if ((NoError == F) & (Cycle < 12)){
#                   Sys.sleep(5)
#                   TinnR$TinnRLibraryUpdate(Cycle)
#                 }
#                }
#    )
#  }

#! Socket OLD

#TinnR$TinnCon <- data.frame(FullAddr = character(), SockName = character(), Service=character(), stringsAsFactors =)
#
#
#TinnR$SetTinnSocketId <- function(sIP, sPort, sName, ServerPort)
#{
#  #print(sIP)
#  #print(sPort)          
#
#  TinnPort <- ServerPort 
#
#  clist <- getSocketClients(port = ServerPort)
#  sname <- names(clist)[clist == paste(sIP, sPort, sep=":")]
#  print("test 1")
#  sendSocketClients("CallForId", sockets = "all", serverport = TinnPort)
#  print("test")          
#  assign(sName, sname, envir = TinnR)
# # attach(TinnR, pos = parent.env(TinnR))
#}
                    

#require(svSocket)

#sendSocketClients("Msg", sockets = "all", serverport = TinnPort)                    
                 
           
#! attach
attach(TinnR)                    

TinnR$ExplorerCounter <- 0


invisible(startSocketServer(port=TinnPort) )

stop('TinnRMSG:ConnectSockets',  sep='')

