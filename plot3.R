main_DATA <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = "character", header=TRUE)

main_DATA$DT <- as.POSIXct(paste(main_DATA$Date, main_DATA$Time), format = "%d/%m/%Y %H:%M:%S")

main_DATA$Date <- as.Date(main_DATA$Date , "%d/%m/%Y")

# Extracts only main_DATA for Dates of Feb. 1st and Feb. 2nd, 2007

DT2<-subset(main_DATA, Date == "2007-02-01" | Date == "2007-02-02")

DT2$Global_active_power <- as.numeric(DT2$Global_active_power)

with(DT2, {
  plot(Sub_metering_1~DT ,type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~DT, col = 'Red')
  lines(Sub_metering_3~DT, col = 'Blue')
})

legend ("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.40)

# Creates a Plot file named "plot3.png"
dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()