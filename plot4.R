##PLOT 2 - GLOBAL ACTIVE POWER
ONE <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
library(data.table)
TWO <- data.table(ONE)
library(dplyr)
TWO <- filter(TWO, Date == "1/2/2007"| Date == "2/2/2007")
TWO <- select(TWO, Global_active_power, Date, Time)

library(lubridate)
TWO <- mutate(TWO, DNT = paste(Date, Time, sep = "_"))
y <- as.numeric(as.character(TWO$Global_active_power))
x <- dmy_hms(TWO$DNT)

##INDEX


##PLOT3-SUBMETERING
THREE <- data.table(ONE)
THREE <- filter(THREE, Date == "1/2/2007"| Date == "2/2/2007")
THREE <- select(THREE, Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time)
THREE <- mutate(THREE, DNT = paste(Date, Time, sep = "_"))
y1 <- as.numeric(as.character(THREE$Sub_metering_1))
y2 <- as.numeric(as.character(THREE$Sub_metering_2))
y3 <- as.numeric(as.character(THREE$Sub_metering_3))

##PLOT4-VOLTAGE

FOUR <- data.table(ONE)
FOUR <- filter(FOUR, Date == "1/2/2007"| Date == "2/2/2007")
FOUR <- select(FOUR, Voltage, Date, Time)
FOUR <- mutate(FOUR, DNT = paste(Date, Time, sep = "_"))
y4 <- as.numeric(as.character(FOUR$Voltage))

##PLOT5-GLOBAL REACTIVE POWER

FIVE <- data.table(ONE)
FIVE <- filter(FIVE, Date == "1/2/2007"| Date == "2/2/2007")
FIVE <- select(FIVE, Global_reactive_power, Date, Time)
FIVE <- mutate(FIVE, DNT = paste(Date, Time, sep = "_"))
y5 <- as.numeric(as.character(FIVE$Global_reactive_power))

par(mfcol = c(2,2))
plot(x,y, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)", pch = 20)
plot(x,y1, type = "l", xlab = " ", ylab = "Energy sub metering",pch = 20)
lines(x,y2, col = c("red"))
lines(x,y3, col = c("blue"))
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)
plot(x,y4, type = "l", xlab = "datetime", ylab = "Voltage", ylim = c(234,246), pch = 20)
plot(x,y5, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0.0,0.5), pch = 20)


dev.copy(png, file = "plot4.png")