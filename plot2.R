# read data
fullData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- subset(fullData, Date == "2/2/2007" | Date == "1/2/2007")

# create time vec
timeStringVec <- paste(data$Date, data$Time, sep=" ")
timeVec <- strptime(timeStringVec, format="%d/%m/%Y %H:%M:%S")

# create plot 2 and save to png
png(filename="plot2.png", width = 480, height = 480)
with(data, plot(timeVec, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis.POSIXct(1,at=c(timeVec[1], timeVec[round(length(timeVec)/2)], timeVec[length(timeVec)]), labels = c("Thu", "Fri", "Sat"))
dev.off()