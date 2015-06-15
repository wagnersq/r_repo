library(tm)

download.file("https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmi_tbl.pdf", "bmi_tbl.pdf", "curl", TRUE)

pdf <- readPDF()
dat <- pdf(elem = list(uri='bmi_tbl.pdf'), language='en', id='id1')
dat <- gsub(' +', ',', dat)

write.csv(dat, "bmi.csv")
dat < read.csv("bmi.csv", stringsAsFactors = FALSE)