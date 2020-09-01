plot3 <- function(){
  library(dplyr)
  library(lubridate)
  x <- subset(read.csv("household_power_consumption.txt", sep = ";"), 
              Date == "1/2/2007")
  y <- subset(read.csv("household_power_consumption.txt", sep = ";"), 
              Date == "2/2/2007")
  x <- rbind(x, y)
  rm(y)
  x$Date <- as.Date(x$Date, "%d/%m/%Y")
  x[,3:9] <- lapply(x[,3:9], as.numeric)
  png(filename = "plot3.png", width = 480, height = 480)
  plot(x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", 
       xaxt = "none")
  lines(x$Sub_metering_2, type = "l", col = "red")
  lines(x$Sub_metering_3, type = "l", col = "blue")
  +axis(1, at = seq(0,2880,1440), labels = c("Thu","Fri","Sat"))
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = 1)
  dev.off()
}