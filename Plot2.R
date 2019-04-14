rm(list = ls())
# reading data
my_data <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
# fitering the date
my_data<-subset(my_data, Date == "2007-02-01"|Date == "2007-02-02")
# Convert dates and times
my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S")
png(filename = "Plot2.png", width = 480, height = 480, units = "px")
plot(my_data$datetime, my_data$Global_active_power, type = "l", ylab="Global Ative Power (kilowatts)", xlab="")
dev.off()