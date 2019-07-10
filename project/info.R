#------------------------------------------------------------------------
# This script runs always when Tinn-R identifies an R instance.
# Aim:
# - Set automatically some options related to R
# - Obtaining essential information regarding of R
# - Install TinnRcom package and its dependencies
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria - Tinn-R Team
# 08/07/2019 13:31:13
#------------------------------------------------------------------------

# the tcltk packges is necessary to show messages inside a TK windows
# mainly to choose the R repository
options(defaultPackages=c(getOption("defaultPackages"), "tcltk"))

# Set repos: Rterm does not always shows the dialog to choose the repository
# The 'repos' will be set by Tinn-R according to user preference
options('repos'='%repos')

# Limitation of the max.print
options('max.print'=1e4)

# Default: if under Windows OS it will install/update only binary packages
if(Sys.info()[['sysname']] == 'Windows'){
  options(pkgType='win.binary')
  options(install.packages.check.source='no')
}

# Workaround bug: MRO and svSocket
unlockBinding("last.warning",
              baseenv())

# debug package: necessary under Rterm interface
options(debug.catfile="stdout")

# Info: tr_info will be the file where R will save info
if(Sys.info()[['sysname']] == 'Windows'){
  tr_info <- paste(Sys.getenv('TEMP'),
                   'Tinn-R',
                   'info.txt',
                   sep='\\')
} else {
  tr_info <- paste('/tmp',
                   'Tinn-R',
                   'info.txt',
                   sep='/')
}

# TinnRcom's dependencies
tr_packs <- c('formatR',
              'svMisc',
              'svSocket')

# Installed packages
inst_packs <- row.names(installed.packages())

# All necessary packages are installed?
tr_packs_dep <- all(tr_packs %in% inst_packs)

# Path: TinnRcom package
trc_path <- try(find.package('TinnRcom'),
                silent=TRUE)

# If trc_path exists get the version
if(file.exists(trc_path)) {
  trc_version <- try(packageVersion('TinnRcom'),
                     silent=TRUE)
} else {
  trc_version <- '0.0.0'
}

# If any dependency is not installed or
# TinnRcom is not installed or
# the TinnRcom version is old: it will try to install TinnRcom and its dependencies
if(!tr_packs_dep ||
   !file.exists(trc_path) ||
   trc_version < '1.0.21')
{
  # Path of user R library
  lib_user <- Sys.getenv('R_LIBS_USER')

  # Check if the folder exists
  if (!dir.exists(lib_user))
  {
    dir.create(lib_user,
               recursive=TRUE)
  }

  # Workdir: stores old
  old_wd <- getwd()

  # Workdir: set new
  # The 'path' will be set by Tinn-R according to its structure
  setwd('%path')

  # The 'install' will be set by Tinn-R according to user preference
  if(%install)
  {
    # Packages: necessary
    if(Sys.info()[['sysname']] == 'Windows'){
      packs <- c('formatR_1.5.zip',
                 'svMisc_1.1.0.zip',
                 'svSocket_0.9-57.zip',
                 'TinnRcom_1.0.21.zip')
    } else {
      packs <- c('formatR_1.5.tar.gz',
                 'svMisc_1.1.0.tar.gz',
                 'svSocket_0.9-57.tar.gz',
                 'TinnRcom_1.0.21.tar.gz')
    }

    # Packages: install
    if(Sys.info()[['sysname']] == 'Windows'){
      install.packages(packs,
                       lib=lib_user,
                       type='win.binary',
                       repos=NULL)
    } else {
      install.packages(packs,
                       lib=lib_user,
                       repos=NULL)
    }

    # Objects: remove
    rm(packs)
  }

  # Workdir: restores old
  setwd(old_wd)

  # Library: add new
  .libPaths(new=lib_user)

  # Objects: remove
  rm(lib_user,
     old_wd)
}

# Path: TinnRcom package
trc_path <- try(find.package('TinnRcom'),
                silent=TRUE)

if(file.exists(trc_path)) {
  trc_path <- try(find.package('TinnRcom'),
                  silent=TRUE)

  trc_version <- try(packageVersion('TinnRcom'),
                     silent=TRUE)
} else {
  trc_path <- 'Not installed'
  trc_version <- '0.0.0'
}

# R: path
r_home <- R.home('bin')

# Connection: write
sink(tr_info)
  cat(r_home,
      trc_path,
      as.character(trc_version),
      .libPaths(),
      fill=1)
sink()

# TinnRcom: require
# The 'load' will be set to TRUE or FALSE by Tinn-R according to user preference
if(%load) {
  if(file.exists(trc_path))
    require(TinnRcom,
            quietly=TRUE)
}

# svSocket: require and connect
# The 'connect' will be set to TRUE or FALSE by Tinn-R according to user preference
if(%connect) {
  svs_path <- try(find.package('svSocket'),
                  silent=TRUE)

  if(file.exists(svs_path))
    require(svSocket,
            quietly=TRUE)

  rm(svs_path)
}

# Objects: remove
rm(inst_packs,
   r_home,
   tr_packs,
   tr_packs_dep,
   trc_path,
   trc_version,
   tr_info)

# Mirros: update
# The 'mirrors' will be set to TRUE or FALSE by Tinn-R according to user preference
if(%mirrors) {
  source('%input')
}