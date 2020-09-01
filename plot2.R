plot2 <- function(){
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
  png(filename = "plot2.png", width = 480, height = 480)
  plot(x$Global_active_power, type = "l", xlab = "", 
       ylab = "Global Active Power (kilowatts)", xaxt = "none")
  +axis(1, at = seq(0,2880,1440), labels = c("Thu","Fri","Sat"))
  dev.off()
}
