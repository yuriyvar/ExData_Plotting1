setwd ("~/Coursera/4 - Exploratory_DA/Proj1/") # Alter the path for your working directory
destFile <- "household_power_consumption.txt"
library(dplyr)
histData <- 
    read.table(destFile, sep=";", na.strings="?", colClasses = "character", header=TRUE, quote = "\"") %>%
    filter(Date == "1/2/2007"|Date == "2/2/2007") %>%
    mutate(Global_active_power = as.numeric(Global_active_power))

# Creates a Plot file named "plot1.png"
png(filename = "plot1.png", width = 480, height = 480)
hist(histData$Global_active_power, col = "red", 
     xlab = "Global Active Power (kiloWatts)", 
     main = "Global Active Power")
dev.off()