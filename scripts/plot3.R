# Exploratory Data Analysis: Project 1
# Plot #3

# Read data into R and assign it to variable called "powerData"
powerData = read.table("./data/household_power_consumption.txt", header=TRUE, 
                       sep=";", row.names=NULL, 
                       stringsAsFactors=FALSE)

# Format the Date variable to Date class
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y") 

# Set date parameters for the subset of the data(2/1/2007 - 2/2/2007)
date1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
date2 <- as.Date("2007-02-02", format = "%Y-%m-%d")

# Subset the data
powerSubData <- powerData[(powerData$Date >= date1) & (powerData$Date <= date2), ]


# Merge variables Date & Time and use strptime to format as Posixlt class
date <- powerSubData$Date
time <- powerSubData$Time
dateTimeChar <- (paste(date, time, sep = " "))
datetime <- (strptime(dateTimeChar, format = "%Y-%m-%d %H:%M:%S"))


# Create plot on png graphics device
png(file = "plot3.png", width = 480, height = 480)

# Plot  energy sub-metering No. 1 (in watt-hour of active energy) 
# Across 2 days (2/1/2007-2/2/2007)
plot(datetime, powerSubData$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")

points(datetime, powerSubData$Sub_metering_2, type = "l", col = "red")

points(datetime, powerSubData$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# close png graphics device
dev.off()
