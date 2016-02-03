## read in the household_power_consumption.txt file
alldata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

#subset data for 1/2/2007 and 2/2/2007
useful <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##change the class of Date and Time
useful$DateTime <- strptime(paste(useful$Date, useful$Time), format = "%d/%m/%Y %H:%M:%S")

##plot2.png
png(filename = "plot2.png")
with(useful, plot(DateTime,Global_active_power, ylab = "Global Active Power (Kilowatts)", col = "black", main = "Global Active Power", type = "l"))
dev.off()
