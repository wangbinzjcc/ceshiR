
find.java <- function() {
  for (root in c("HLM", "HCU")) 
    for (key in c("Software\\JavaSoft\\Java Runtime Environment"
                  , "Software\\JavaSoft\\Java Development Kit")) {
    hive <- try(utils::readRegistry(key, root, 2), 
                silent = TRUE)
    if (!inherits(hive, "try-error")) 
      return(hive)
                                                                 }
    hive
                       }
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk1.7.0_12") 
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre7") 
require(rJava)
require(XLConnect)
?XLConnect

# Load workbook; create if not existing
wb <- loadWorkbook("XLConnect.xlsx", create = TRUE)

# Create a worksheet
createSheet(wb, name = "mtcars")

# Create a name reference
createName(wb, name = "mtcars", formula = "mtcars!$A$1")

# Write built-in data.frame 'mtcars' to the specified named region
writeNamedRegion(wb, mtcars, name = "mtcars")

# Save workbook
saveWorkbook(wb)

###############################

## Example 1:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read named region 'mtcars' (with default header = TRUE)
data <- readNamedRegion(wb, name = "mtcars")

## Example 2;
# conversion xlsx file from demoFiles subfolder of package XLConnect
excelFile <- system.file("demoFiles/conversion.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(excelFile)

# Read named region 'conversion' with pre-specified column types
# Note: in the worksheet all data was entered as strings!
# forceConversion = TRUE is used to force conversion from String
# into the less generic data types Numeric, DateTime & Boolean
df <- readNamedRegion(wb, name = "conversion", header = TRUE,
                      colTypes = c(XLC$DATA_TYPE.NUMERIC,
                                   XLC$DATA_TYPE.DATETIME,
                                   XLC$DATA_TYPE.BOOLEAN),
                      forceConversion = TRUE,
                      dateTimeFormat = "%Y-%m-%d %H:%M:%S")

## Example 3:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read the columns 1, 3 and 5 of the named region 'mtcars' (with default header = TRUE)
data <- readNamedRegion(wb, name = "mtcars", keep=c(1,3,5))

############









