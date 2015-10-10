library(dplyr)
library(magrittr)
library(lubridate)
library(readr) #reads 10x as fast as base function

power.data <- read_csv2("household_power_consumption.txt") %>%
  tbl_df() %>%
  filter(dmy(Date) == ymd("2007-02-01")|dmy(Date) == ymd("2007-02-02"))

png("plot2.png", width = 480, height = 480)

plot(power.data$Global_active_power, xaxt = "n", ann = FALSE, type = "lwd")
title(ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
