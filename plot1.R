library(dplyr)
library(magrittr)
library(lubridate)
library(readr) #reads 10x as fast as base

power.data <- read_csv2("household_power_consumption.txt") %>%
  tbl_df() %>%
  filter(dmy(Date) == ymd("2007-02-01")|dmy(Date) == ymd("2007-02-02"))

png("plot1.png", width = 480, height = 480)

hist(power.data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", freq = TRUE,
     main = "Global Active Power")

dev.off()
