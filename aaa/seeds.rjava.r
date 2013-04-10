#############################################################################
#   read seedings data in the excel books with xlsx.   wb 2013-4-10 9:03:02   
#############################################################################
find.java <- function() {
  for (root in c("HLM", "HCU")) 
    for (key in c("Software\\JavaSoft\\Java Runtime Environment"
                  , "Software\\JavaSoft\\Java Development Kit")) {
      hive <- try(utils::readRegistry(key, root, 2), 
                  silent = TRUE)
      if (!inherits(hive, "try-error")) 
        return(hive)                                             }
   hive                 }
# find.java()
####################################
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre7")
require(rJava)
require(XLConnect)
#
fildat <- "F:\\DataW\\seeds\\dataseed"
setwd(fildat)
di0 <- dir(fildat)[2]; di0
df.one <- cbind(readWorksheetFromFile(di0,sheet=2), time=substr(di0,1,10))
#
SSA <- lapply(dir(fildat),function(X)
                 cbind(readWorksheetFromFile(X,sheet=2),time=substr(X,1,10))
              )
SSA00 <- do.call(rbind,SSA) 
#
writeWorksheetToFile("Seeds-data-result.xlsx"
                    , data = list(i1 = SSA00, i2 = 1:10, i3 = 9:1)
                    , sheet = c("FirstSheet", "SecondSheet", "ThirdSheet")
                    , startRow = c(1,10,5), startCol = c(1,11,5)
                    )
#######################################################################################