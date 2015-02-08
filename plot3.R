HHNRG <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
library(data.table)
HHNRG <- data.table(HHNRG)
library(dplyr)
HHNRG <- filter(HHNRG, Date == "1/2/2007"| Date == "2/2/2007")
HHNRG <- select(HHNRG, Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time)

library(lubridate)
HHNRG <- mutate(HHNRG, DNT = paste(Date, Time, sep = "_"))
y1 <- as.numeric(as.character(HHNRG$Sub_metering_1))
y2 <- as.numeric(as.character(HHNRG$Sub_metering_2))
y3 <- as.numeric(as.character(HHNRG$Sub_metering_3))
x <- dmy_hms(HHNRG$DNT)
png('plot3.png')
plot(x,y1, type = "l", xlab = " ", ylab = "Energy sub metering")
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
dev.off()


