Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk1.7.0_12")
require(rJava)
require(XLConnect)
fil0 <- "F:/GitHub/ceshiR/aaa"
setwd(fil0)
dd <- dir(fil0,'xls') ; dd
demoEF0 <- paste(fil0, dd[4],sep='/')
wb <- loadWorkbook(demoEF0); wb
readNamedRegion(wb,name="mm")
data <- readNamedRegion(wb, name = "aa")
data
Sheet1
## Example 1:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")
# Load workbook
wb <- loadWorkbook(demoExcelFile)
 # Read named region 'mtcars' (with default header = TRUE)
data <- readNamedRegion(wb, name = "mtcars")

 

# multiregion xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx", 
                             package = "XLConnect")

# Load a single named region into a single data.frame.
df <- readNamedRegionFromFile(demoExcelFile, name="Iris")

# Load multiple regions at once - returns a (named) list 
# of data.frames.
df <- readNamedRegionFromFile(demoExcelFile, 
                              name=c("Calendar", "Iris", "IQ"))











