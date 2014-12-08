main_DATA <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = "character", header=TRUE)

main_DATA$DT <- as.POSIXct(paste(main_DATA$Date, main_DATA$Time), format = "%d/%m/%Y %H:%M:%S")

main_DATA$Date <- as.Date(main_DATA$Date , "%d/%m/%Y")

# Extracts only main_DATA for Dates of Feb. 1st and Feb. 2nd, 2007

DT2<-subset(main_DATA, Date == "2007-02-01" | Date == "2007-02-02")

DT2$Global_active_power <- as.numeric(DT2$Global_active_power)

plot(DT2$Global_active_power~DT2$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Creates a Plot file named "plot2.png"
dev.copy(png, file = "plot2.png", height=480, width=480)

dev.off()