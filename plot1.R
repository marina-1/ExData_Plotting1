# read data
fullData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- subset(fullData, Date == "2/2/2007" | Date == "1/2/2007")

# create plot 1 and save to png
png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red2", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()