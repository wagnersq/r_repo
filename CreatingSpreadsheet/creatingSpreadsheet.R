# Installing XLConnect package
install.packages("XLConnect")

# Loading XLConnect package
require(XLConnect)
 
# Creating a new workbook
wb <- loadWorkbook("CreatingSpreadsheetWithR.xlsx", create = TRUE)
 
# Creating a new sheet called "Red Sheet"
createSheet(wb, name = "Red Sheet")
 
# Setting the sheet tab color to red
setSheetColor(wb, "Red Sheet", XLC$COLOR.RED)
 
# Creating a new sheet called "Green Sheet"
createSheet(wb, name = "Green Sheet")
 
# Setting the sheet tab color to green
setSheetColor(wb, "Green Sheet", XLC$COLOR.GREEN)
 
# Writing the mtcars data frame on the Red Sheet, with header and row names
writeWorksheet (wb, data=mtcars, sheet="Red Sheet", header = TRUE, rownames="Cars")
 
# Autosizing the first column in the Red Sheet
setColumnWidth(wb, sheet="Red Sheet", column=1)
 
# Writing the USJudgeRatings data frame on the Green Sheet, with header and row names
writeWorksheet (wb, data=USJudgeRatings, sheet="Green Sheet", header = TRUE, rownames="Judge")
 
# Autosizing the first column in the Green Sheet
setColumnWidth(wb, sheet="Green Sheet", column=1)
 
# Creating a freeze pane in the Red Sheet. The top row and the leftmost column are frozen.
createFreezePane(wb, "Red Sheet", "B", 2)
 
# Creating a split pane on the Green Sheet, with coordinates (5000, 5000) expressed as 1/20th of a point,
# "J" as the left column visible in the right pane and 10 as the top row visible in the bottom pane 
createSplitPane(wb, "Green Sheet", 5000, 5000, "J", 10)
 
# Saving the workbook
saveWorkbook(wb)