#------------------------------------------------------------------------
# This script runs under request.
# Aim:
# - Obtaining essential information regarding of R mirrors
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria - Tinn-R Team
# 23/08/2016 07:51:12
#------------------------------------------------------------------------

# Temp: \Users\user\AppData\Local\Temp\Tinn-R\mirrors.txt
tr_mirrors <- paste(Sys.getenv('TEMP'),
                    'Tinn-R',
                    'mirrors.txt',
                    sep='\\')

# Mirrors: get
mirrors <- getCRANmirrors()

# Mirrors: selection of information
mirrors <- subset(mirrors,
                  select=c('Name',
                           'Country',
                           'City',
                           'URL',
                           'Host',
                           'CountryCode'))

# Mirrors: all information in sigle lines
op <- options()
options(width=300)

# Connection: write
sink(tr_mirrors)
  write.table(mirrors,
              row.names=FALSE,
              col.names=FALSE,
              sep='|')

# Restore IO and Options
sink()
options(op)

# Objects: remove
rm(tr_mirrors,
   mirrors,
   op)