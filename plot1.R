# File: plot1.R
# Author: Pablo Doval (pablo.doval@gmail.com)
# Date Created: 2015-02-07
# Description:
# Performs a histogram plot of the Global Active Power for two days of the
# Household Electric Power Consumption data set, which can be downloaded at:
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
subset <- sourceData[sourceData$Date == "2007-02-01" | sourceData$Date == "2007-02-02", c(1:3)]

# Now that we have a smaller data set, we convert the numeric values
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))

# Now we are ready to plot the data
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(6, 6, 5, 5))
hist(subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()