library(foreign)
data <- read.csv2("household_power_consumption.txt", header = TRUE, na.strings="?")
head(data)
data$DateTime <- strptime(paste0(data$Date,' ',data$Time), '%d/%m/%Y %H:%M:%OS')
datareduced <- data[format(data$DateTime, "%Y%m%d") == '20070201' | format(data$DateTime, "%Y%m%d") == '20070202',]
datareduced$Global_active_power <- as.numeric(datareduced$Global_active_power)
png("plot1.png", width=480, height=480)
hist(datareduced$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
