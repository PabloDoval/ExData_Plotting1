# File: plot4.R
# Author: Pablo Doval (pablo.doval@gmail.com)
# Date Created: 2015-02-07
# Description:
# Performs a set of four plots of the Household Electric Power Consumption
# data set, which can be downloaded at:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# NOTES:
# - This script loads a big dataset into memory; make sure you have at least
#   80 Mb available on your machine before attempting to run it.
# - This script requires the data file to be downloaded previuosly, and to 
#   set the working directoy into the specific directory where the data was 
#   uncompressed.

Sys.setlocale("LC_TIME", "C")

setwd("~/coursera/ExploratoryDataAnalysis/ExData_Plotting1")
sourceData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert the Date column to an actual Date
sourceData$Date <- as.Date(sourceData$Date, format="%d/%m/%Y")

# Subset on the required dates
subset <- sourceData[sourceData$Date == "2007-02-01" | sourceData$Date == "2007-02-02", ]

# Now that we have a smaller data set, we convert the numeric values and combine
# the date and time
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
subset$GSub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))
subset$DateTime <- strptime(paste(subset$Date, subset$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

# Now we are ready to plot the data
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(4, 4, 2, 2))

par(mfrow=c(2, 2))

plot(subset$DateTime, subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

plot(subset$DateTime, subset$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(subset$DateTime, subset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(subset$DateTime, subset$Sub_metering_2, col="red")
lines(subset$DateTime, subset$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subset$DateTime, subset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_Power")

dev.off()