plot1 <- function(){
  library(dplyr)
  library(lubridate)
  x <- subset(read.csv("household_power_consumption.txt", sep = ";"), 
              Date == "1/2/2007")
  y <- subset(read.csv("household_power_consumption.txt", sep = ";"), 
              Date == "2/2/2007")
  x <- rbind(x, y)
  rm(y)
  x$Date <- as.Date(x$Date, "%d/%m/%y")
  x$dt <- strptime(paste(x$Date, x$Time), format = "%Y-%m-%d %H:%M:%S")
  x[,3:9] <- lapply(x[,3:9], as.numeric)
  
  png(filename = "plot1.png", width = 480, height = 480)
  hist(x$Global_active_power, col="red",
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power")
  dev.off()
}