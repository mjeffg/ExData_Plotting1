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

# Merge variables Date & Time and use strptime to format as Posixlt class
date <- powerSubData$Date
time <- powerSubData$Time
dateTimeChar <- (paste(date, time, sep = " "))
datetime <- (strptime(dateTimeChar, format = "%Y-%m-%d %H:%M:%S"))

# Create a plot on png graphics device
png(file = "plot2.png")
# Plot household global minute-averaged active power (in kilowatt)
# across 2 days (2/1/2007 - 2/1/2007)
plot(datetime, powerSubData$Global_active_power, type = "l", xlab = "",  ylab = "Global active power(kilowatts)")
# turn png device off
dev.off()
