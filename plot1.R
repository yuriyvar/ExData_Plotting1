
main_DATA<-read.table("household_power_consumption.txt",sep=";",na.strings="?",colClasses = "character", header=TRUE)

main_DATA$Date <- as.Date(main_DATA$Date, "%d/%m/%Y")

main_DATA$DT <- as.POSIXct(paste(main_DATA$Date, main_DATA$Time), format = "%d/%m/%Y %H:%M:%S")

# Extracts only data for Dates of Feb. 1st and Feb. 2nd, 2007

DT2<-subset(main_DATA, Date == "2007-02-01"|Date == "2007-02-02")

DT2$Global_active_power <- as.numeric(DT2$Global_active_power)

hist(DT2$Global_active_power, col = "red", xlab = "Global Active Power (in kilowatts)", main = "Global Active Power")

# Creates a Plot file named "plot1.png"
dev.copy(png, file = "plot1.png", height=480, width=480)

dev.off()