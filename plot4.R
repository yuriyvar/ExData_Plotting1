main_DATA <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = "character", header=TRUE)

main_DATA$DT <- as.POSIXct(paste(main_DATA$Date, main_DATA$Time), format = "%d/%m/%Y %H:%M:%S")

main_DATA$Date <- as.Date(main_DATA$Date , "%d/%m/%Y")

# Extracts only main_DATA for Dates of Feb. 1st and Feb. 2nd, 2007

DT2<-subset(main_DATA, Date == "2007-02-01" | Date == "2007-02-02")

DT2Global_active_power <- as.numeric(DT2$Global_active_power)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(DT2, {
  plot(Global_active_power~DT, type = "l",ylab="Global Active Power (kilowatts)", xlab = "")
  plot(Voltage~DT, type = "l", ylab = "Voltage (volt)", xlab = "")
  plot(Sub_metering_1~DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~DT, col = 'Red') 
  lines(Sub_metering_3~DT,col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
	         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.40)
  plot(Global_reactive_power~DT, type = "l", ylab = "Global Rective Power (kilowatts)",xlab = "")
})

# Creates a Plot file named "plot4.png"
dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()
