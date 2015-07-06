data <- data.frame(sex = c(rep(1, 1000), rep(2, 1000)),
                   treatment = rep(c(1, 2), 1000),
                   response1 = rnorm(2000, 0, 1),
                   response2 = rnorm(2000, 0, 1))

head(data)

mean(subset(data, sex == 1 & treatment == 1)$response1)

sd(subset(data, sex == 1 & treatment == 1)$response1)

sd(subset(data, sex == 1 & treatment == 1)$response1)/
  sqrt(nrow(subset(data, sex == 1 & treatment == 1)))

library(plyr)

library(reshape2)

melted <- melt(data, id.vars=c("sex", "treatment"))

ddply(melted, c("sex", "treatment", "variable"), summarise,
      mean = mean(value), sd = sd(value),
      sem = sd(value)/sqrt(length(value)))