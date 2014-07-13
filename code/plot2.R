graphics.off()
rm(list=ls())

# Importation of the data
# The household_power_consumption data file should be in the working environment

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", dec=".", na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric","numeric"))

#Subsetting for the two days (01/02/2007 and 02/02/2007)
data <- subset(household_power_consumption, Date=="1/2/2007"|Date=="2/2/2007")

# Plot 2 (time series)
with(data, {
  time <- strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S")
  plot(time, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)") 
  r <- as.POSIXct(round(range(time), "days"))
})

dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
dev.off()
