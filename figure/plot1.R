## read in the household_power_consumption.txt file
alldata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

#subset data for 1/2/2007 and 2/2/2007
useful <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##plot1.png
png(filename = "plot1.png")
with(useful, hist(Global_active_power, xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power"))
dev.off()
