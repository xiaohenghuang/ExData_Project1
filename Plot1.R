rm(list = ls())
# reading data
my_data <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
# fitering the date
my_data<-subset(my_data, Date == "2007-02-01"|Date == "2007-02-02")
# Convert dates and times
my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S")
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(my_data$Global_active_power, xlab="Global Ative Power (kilowatts)", col = "red", main = "Global Ative Power")
dev.off()
