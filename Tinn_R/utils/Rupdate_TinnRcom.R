# This script runs always when Tinn-R identifies an R instance
# and detects an old version of TinnRcom package installed.
# It has the purpose of update the TinnRcom package to the latest version.
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria
# 2014-01-24 08:15:20
#------------------------------------------------------------------------

# Try to detach
try(detach(package:TinnRcom),
    silent=TRUE)

# Try to remove
try(remove.packages('TinnRcom'),
    silent=TRUE)

# Install: Tinn-R will replace %version by the latest version of TinnRcom
# available in the "package" folder where the program is installed.
install.packages('%version',
                 repos=NULL)

# Reload
library(TinnRcom)
