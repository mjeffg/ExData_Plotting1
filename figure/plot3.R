# Read Individual household electric power consumption dataset from
# UC Irvine Machine Learning Repository into R to perform exploratory graphing
powerData <- read.table("./household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
str(powerData)

# Format the Date variable to Date class
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y") 
# Set date parameters for the subset of the data(2/1/2007 - 2/2/2007)
date1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
date2 <- as.Date("2007-02-02", format = "%Y-%m-%d")
# Subset the data
powerSubData <- powerData[(powerData$Date >= date1) & (powerData$Date <= date2), ]
str(powerSubData)

# Create plot on png graphics device
png(file = "plot3.png")
# Plot  energy sub-metering No. 1 (in watt-hour of active energy) 
# Across 2 days (2/1/2007-2/2/2007)
plot(datetime, powerSubData$Sub_metering_1, type = "l", ylab = "Energy sub metering")
points(datetime, powerSubData$Sub_metering_2, type = "l", col = "red")
points(datetime, powerSubData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
# close png graphics device
dev.off()
