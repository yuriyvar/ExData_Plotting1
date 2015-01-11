setwd ("~/Coursera/4 - Exploratory_DA/Proj1/") # Alter the path for your working directory
destFile <- "household_power_consumption.txt"
library(dplyr)
plotData <- 
    read.table(destFile, sep=";", na.strings="?", colClasses = "character", header=TRUE, quote = "\"") %>%
    filter(Date == "1/2/2007"|Date == "2/2/2007") %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Creates a Plot file named "plot2.png"
png(filename = "plot2.png", width = 480, height = 480)
plot(plotData$DateTime, plotData$Global_active_power, type = "l", 
                      ylab = "Global Active Power (kilowatts)", 
                      xlab="")
dev.off()