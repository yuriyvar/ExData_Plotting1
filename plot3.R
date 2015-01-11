setwd ("~/Coursera/4 - Exploratory_DA/Proj1/") # Alter the path for your working directory
destFile <- "household_power_consumption.txt"
library(dplyr)
plotData <- 
    read.table(destFile, sep=";", na.strings="?", colClasses = "character", header=TRUE, quote = "\"") %>%
    filter(Date == "1/2/2007"|Date == "2/2/2007") %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Creates a Plot file named "plot3.png"
png(filename = "plot3.png", width = 480, height = 480)
with(plotData, {
  plot(plotData$DateTime, plotData$Sub_metering_1 ,type = "l", ylab = "Energy sub metering", xlab="")
  lines(plotData$DateTime, plotData$Sub_metering_2, col = 'Red')
  lines(plotData$DateTime, plotData$Sub_metering_3, col = 'Blue')
})

legend("topright", lty = 1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.80)
dev.off()