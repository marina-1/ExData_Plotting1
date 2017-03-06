# read data
fullData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- subset(fullData, Date == "2/2/2007" | Date == "1/2/2007")

# create time vec
timeStringVec <- paste(data$Date, data$Time, sep=" ")
timeVec <- strptime(timeStringVec, format="%d/%m/%Y %H:%M:%S")

# create plot 4 and save to png
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
  #1,1
  plot(timeVec, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l", xaxt = "n")
  axis.POSIXct(1,at=c(timeVec[1], timeVec[round(length(timeVec)/2)], timeVec[length(timeVec)]), labels = c("Thu", "Fri", "Sat"))
  #1,2
  plot(timeVec, Voltage, xlab = "datetime", ylab = "Voltage", type = "l", xaxt = "n")
  axis.POSIXct(1,at=c(timeVec[1], timeVec[round(length(timeVec)/2)], timeVec[length(timeVec)]), labels = c("Thu", "Fri", "Sat"))
  #2,1
  plot(timeVec, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
  lines(timeVec, Sub_metering_2, type = "l", col = "red2")
  lines(timeVec, Sub_metering_3, type = "l", col = "blue")
  axis.POSIXct(1,at=c(timeVec[1], timeVec[round(length(timeVec)/2)], timeVec[length(timeVec)]), labels = c("Thu", "Fri", "Sat"))
  legend("topright", lwd=c(1,1,1), bty = "n", col = c("black", "red2", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #2,2
  plot(timeVec, Global_reactive_power, xlab = "datetime", type = "l", xaxt = "n")
  axis.POSIXct(1,at=c(timeVec[1], timeVec[round(length(timeVec)/2)], timeVec[length(timeVec)]), labels = c("Thu", "Fri", "Sat"))
})
dev.off()