#------------------------------------------------------------------------
# This script will generate a text file with the example of an R object.
# Subsequently, the file will be opened in the editor to see the content
# and interactive learning.
#------------------------------------------------------------------------
#.. Please, do not change if you do not know what you're doing!
# J.C.Faria - Tinn-R Team
# 04/09/2019 09:55:48
#------------------------------------------------------------------------

writeLines(example(%topic,
                   give.lines=TRUE,
                   package=NULL),
           '%file')
