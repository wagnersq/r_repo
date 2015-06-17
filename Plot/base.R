#Load Data
#Make sure months stay ordered - first time I ever wanted a factor!
#Label x-axis with every fifth label...need to use character(0) in base graphics, not " "?
visits_visitors <- read.csv("visits_visitors.csv")
visits_visitors$Month <- factor(visits_visitors$Month, levels = visits_visitors$Month, ordered = TRUE)
visits_visitors$Month_ <- ifelse(as.numeric(row.names(visits_visitors)) %% 5 == 0, as.character(visits_visitors$Month), character(0))

#Set up plot space for plot & add horizontal lines 
barplot(visits_visitors$Views, ylim = c(0,10000), las=1, border = NA, col.axis = "darkgray", tick = FALSE)
abline(h=seq(2000,10000, 2000), col='lightgray')

#Make views barplot
barplot(visits_visitors$Views, names.arg=visits_visitors$Month_, col = "#278DBC", 
        border = NA, add = TRUE, yaxt='n', ann = FALSE, col.axis = "darkgray")

#Make visitors barplot
#Width & space parameters move bars from their "center points" on the x-axis?
barplot(visits_visitors$Visitors, col = "navyblue", 
        border = NA, add = TRUE, yaxt='n',  xaxt= 'n', ann = FALSE,
        legend.text = c("Views", "Visitors"),
        args.legend = list(x="topright", ncol = 2, fill = c("#278DBC", "navyblue"), bty='n', border=FALSE))

