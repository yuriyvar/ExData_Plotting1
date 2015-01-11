setwd ("~/Coursera/4 - Exploratory_DA/Proj1/") # Alter the path for your working directory
destFile <- "household_power_consumption.txt"
library(dplyr)
plotData <- 
    read.table(destFile, sep=";", na.strings="?", colClasses = "character", header=TRUE, quote = "\"") %>%
    filter(Date == "1/2/2007"|Date == "2/2/2007") %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Creates a Plot file named "plot4.png"
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,4,2))
with(plotData, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab="")
  plot(DateTime, Voltage, type = "l", ylab = "Voltage (Volt)", xlab="datetime")
  plot(DateTime, Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
  lines(DateTime, Sub_metering_2, col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
  legend("topright", lty = 1, col=c("black", "red", "blue"), lwd = 2, bty = "n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.80)
  plot(plotData$DateTime, plotData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")
})
dev.off()