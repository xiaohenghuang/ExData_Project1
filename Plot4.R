rm(list = ls())
# reading data
my_data <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
# fitering the date
my_data<-subset(my_data, Date == "2007-02-01"|Date == "2007-02-02")
# Convert dates and times
my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "Plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(my_data$datetime, my_data$Global_active_power, type = "l", ylab="Global Ative Power", xlab="")

plot(my_data$datetime, my_data$Voltage, type = "l", ylab="Voltage", xlab = "datetime")

plot(my_data$datetime, my_data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="l")
lines(my_data$datetime, my_data$Sub_metering_2, col="red")
lines(my_data$datetime, my_data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

plot(my_data$datetime, my_data$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab = "datetime")
dev.off()
