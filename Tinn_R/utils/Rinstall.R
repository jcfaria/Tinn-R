# This script will install all dependencies and
# the necessary TinnRcom package.
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria
# 2013-10-21 12:03:23
#------------------------------------------------------------------------

# Try to detach
try(detach(package:TinnRcom),
    silent=TRUE)

# Try to remove
try(remove.packages('TinnRcom'),
    silent=TRUE)

# Check packages TinnRcom depends
depends <- c('svSocket',
             'formatR',
             'R2HTML',
             'Hmisc')

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
