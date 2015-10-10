library(dplyr)
library(magrittr)
library(lubridate)
library(readr) 

power.data <- read_csv2("household_power_consumption.txt") %>%
  tbl_df() %>%
  filter(dmy(Date) == ymd("2007-02-01")|dmy(Date) == ymd("2007-02-02")) 

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mfcol = c(2,2))

plot(power.data$Global_active_power, xaxt = "n", ann = FALSE, type = "lwd")
title(ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(power.data$Sub_metering_1, xaxt = "n", ann = FALSE, type = "lwd")
lines(power.data$Sub_metering_2, col = "red")
lines(power.data$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
title(ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = TRUE)

plot(power.data$Voltage, xaxt = "n", ann = FALSE, type = "lwd")
title(ylab = "Voltage", xlab = "datetime")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(power.data$Global_reactive_power, xaxt = "n", ann = FALSE, type = "lwd")
title(ylab = "Global_reactive_power", xlab = "datetime")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()


