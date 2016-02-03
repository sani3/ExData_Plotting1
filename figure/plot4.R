## read in the household_power_consumption.txt file
alldata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

#subset data for 1/2/2007 and 2/2/2007
useful <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##change the class of Date and Time
useful$DateTime <- strptime(paste(useful$Date, useful$Time), format = "%d/%m/%Y %H:%M:%S")

##plot3.png
png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(2, 4, 2, 1))

##first plot
with(useful, plot(DateTime,Global_active_power, ylab = "Global Active Power (Kilowatts)", col = "black", type = "l"))

##second plot
with(useful, plot(DateTime, Voltage, ylab = "Voltage", col = "black", type = "l"))

##Third plot
with(useful, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", col = "black", type = "l"))
with(useful, lines(DateTime, Sub_metering_2, col = "red", type = "l"))
with(useful, lines(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##fourth plot
with(useful, plot(DateTime, Global_reactive_power, col = "black", type = "l"))

dev.off()
