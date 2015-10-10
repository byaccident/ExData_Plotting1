library(dplyr)
library(magrittr)
library(lubridate)
library(readr) 

power.data <- read_csv2("household_power_consumption.txt") %>%
  tbl_df() %>%
  filter(dmy(Date) == ymd("2007-02-01")|dmy(Date) == ymd("2007-02-02")) 

png("plot3.png", width = 480, height = 480)

plot(power.data$Sub_metering_1, xaxt = "n", ann = FALSE, type = "lwd")
lines(power.data$Sub_metering_2, col = "red")
lines(power.data$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
title(ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = TRUE)

dev.off()