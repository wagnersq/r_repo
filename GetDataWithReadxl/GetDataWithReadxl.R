install.packages("readxl")

library(readxl)

sample <- system.file("extdata", "datasets.xlsx", package = "readxl")

head(read_excel(sample, 2))

excel_sheets(sample)

head(read_excel(sample, "mtcars"))