#------------------------------------------------------------------------
# This script will install all dependencies and
# the necessary TinnRcom package.
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria - Tinn-R Team
# 18/07/2015 12:15:45
#------------------------------------------------------------------------

# By default it will install/update only binary packages
options(pkgType='binary')
options(install.packages.check.source='no')

# Try to detach
try(detach(package:TinnRcom),
    silent=TRUE)

# Try to remove
try(remove.packages('TinnRcom'),
    silent=TRUE)

# Check packages TinnRcom depends
depends <- c('svSocket',
             'formatR')

installed <- depends %in%
             installed.packages()[, 'Package']

# Set repos: Rterm does not always shows the dialog to choose the repository
options('repos'='%repos')

if (length(depends[!installed]) >= 1)
{
  cat('\n')
  cat('Installing TinnRcom dependences. Please, wait...')
  cat('\n')
  install.packages(depends[!installed])
}

rm(depends,
   installed)

cat('\n')
cat('Installing TinnRcom package. Please, wait...')
cat('\n')
