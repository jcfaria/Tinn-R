#------------------------------------------------------------------------
# This script will install all dependencies and
# the necessary TinnRcom package.
#------------------------------------------------------------------------
#.. Please, do not change if you do not know what you're doing!
# J.C.Faria - Tinn-R Team
# 06/05/2020 19:33:43
#------------------------------------------------------------------------

# By default it will install/update only binary packages
options(pkgType='win.binary')

# Workdir: stores
old_wd <- getwd()

# The 'path' will be set by Tinn-R according to its structure
setwd('%path')

# Packages: detaching (if loaded)
try(detach('package:TinnRcom'),
    silent=TRUE)

try(detach('package:formatR'),
    silent=TRUE)

try(detach('package:svMisc'),
    silent=TRUE)

try(detach('package:svSocket'),
    silent=TRUE)

# Packages: necessary
packs <- c('formatR_1.7.zip',
           'svMisc_1.1.0.zip',
           'svSocket_1.0.0.zip',
           'TinnRcom_1.0.21.zip')

# Packages: install
install.packages(packs,
                 repos=NULL,
                 type='win.binary',
                 lib=.libPaths()[1L])

# Workdir: restores
setwd(old_wd)

# Remove not more necessary objets
rm(old_wd,
   packs)
