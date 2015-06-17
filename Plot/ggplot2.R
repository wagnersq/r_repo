library(ggplot2)

#Load Data
#Make sure months stay ordered - first time I ever wanted a factor!
#Label x-axis with every fifth label
visits_visitors <- read.csv("visits_visitors.csv")
visits_visitors$Month <- factor(visits_visitors$Month, levels = visits_visitors$Month, ordered = TRUE)
visits_visitors$Month_ <- ifelse(as.numeric(row.names(visits_visitors)) %% 5 == 0, as.character(visits_visitors$Month), "")

#Build plot as a series of elements
ggplot() + 
  geom_bar(data=visits_visitors, aes(x= Month, y= Views, colour = "lightblue"), stat = "identity", fill = '#278DBC') +
  geom_bar(data=visits_visitors, aes(x= Month, y= Visitors, colour="navyblue"), stat="identity", fill = "navyblue", width = .6) +
  scale_y_continuous(breaks=c(0,2000,4000,6000,8000,10000)) +
  scale_x_discrete(labels=visits_visitors$Month_) +
  xlab("") + 
  ylab("") +
  scale_colour_manual(name = '', values =c('lightblue'='#278DBC','navyblue'='navyblue'), labels = c('Views','Visitors'))+
  scale_fill_manual(values =c('lightblue'='#278DBC','navyblue'='navyblue'))+
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_line(size=.05, color="gray" ),
    panel.background = element_rect(fill='white', colour='white'),
    axis.ticks = element_blank(),
    legend.position = c(.9, 1),
    legend.direction = "horizontal"
  )