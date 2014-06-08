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

# Create plot on png file device
png(file = "plot1.png")
# Plot a histogram of household global minute-averaged active power (in kilowatt)
# Transform Global_active_power variable from character class to numeric for histogram
globalActivePower <- (as.numeric(powerSubData$Global_active_power))
hist(globalActivePower, col = "red", xlab = "Global active power(kilowatts)", main = "Global active power")
dev.off()
