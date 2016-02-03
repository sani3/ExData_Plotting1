## read in the household_power_consumption.txt file
alldata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

#subset data for 1/2/2007 and 2/2/2007
useful <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##change the class of Date and Time
useful$DateTime <- strptime(paste(useful$Date, useful$Time), format = "%d/%m/%Y %H:%M:%S")

##plot3.png
png(filename = "plot3.png")
with(useful, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", col = "black", main = "Global Active Power", type = "l"))
with(useful, lines(DateTime, Sub_metering_2, col = "red", type = "l"))
with(useful, lines(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
