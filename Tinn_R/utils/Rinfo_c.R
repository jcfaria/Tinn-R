# This script runs always when Tinn-R identifies an R instance.
# It has the purpose of obtaining essential information regarding of
# R, CRAN mirrors and TinnRcom package.
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria
# 28/01/2014 00:39:20
#------------------------------------------------------------------------

# Set repos: Rterm does not always shows the dialog to choose the repository
options('repos'='%repos')

# Necessary to package "debug" under Rterm interface
options(debug.catfile="stdout")

# Tinn-R/tmp/R_info.txt
tr_info <- paste(Sys.getenv('APPDATA'),
                 'Tinn-R',
                 'tmp',
                 'Rinfo.txt',
                 sep='\\')

# R path
r_home <- R.home('bin')

# TinnRcom path
trc_path <- try(find.package('TinnRcom'),
                silent=TRUE)

if(!file.exists(trc_path))
{
  trc_path    <- 'Not installed!'
  trc_version <- 'x.x-x   :('
} else
  trc_version <- try(packageVersion('TinnRcom'),
                     silent=TRUE)

sink(tr_info)
  # Write to a connection
  cat(r_home,
      trc_path,
      as.character(trc_version),
      .libPaths(),
      fill=1)
sink()

# Tinn-R/tmp/Rmirros.txt
tr_mirrors <- paste(Sys.getenv('APPDATA'),
                    'Tinn-R',
                    'tmp',
                    'Rmirrors.txt',
                    sep='\\')

mirrors <- getCRANmirrors()

mirrors <- subset(mirrors, 
                  select=-c(Maintainer,  # Incomplete
                            OK))         # Not useful

op <- options()
options(width=300)  # All information in sigle lines

sink(tr_mirrors)
  # Write to a connection
  write.table(mirrors, 
              row.names=FALSE, 
              col.names=FALSE, 
              sep='|')
sink()

options(op)

# Remove objects
rm(tr_info,
   tr_mirrors,
   r_home,
   trc_path,
   trc_version,
   mirrors,
   op)
