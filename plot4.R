library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- tbl_df(data)
data2 <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(datetime = paste(Date, Time)) %>% mutate(datetime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S"))
png(file = "plot4.png")
par(mfcol = c(2,2))
#1
plot(data2$datetime, as.numeric(data2$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
#2
plot(data2$datetime, data2$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data2$datetime, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$datetime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(2,2,2))
#3
plot(data2$datetime, data2$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
#4
plot(data2$datetime, as.numeric(data2$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()