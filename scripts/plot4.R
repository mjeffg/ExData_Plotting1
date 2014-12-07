# Exploratory Data Analysis: Project 1
# Plot #4

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


# Create plot on png grapics device
png(file = "plot4.png", width = 480, height = 480)

# Plot household global minute-averaged active power (in kilowatt),
#       minute-averaged voltage (in volt),  
#       energy sub-metering No. 1 (in watt-hour of active energy),
#       household global minute-averaged reactive power (in kilowatt)
#       across 2 days (2/1/2007-2/2/2007)
#       fourth plot
par(mfrow = c(2, 2))
plot(datetime, powerSubData$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(datetime, powerSubData$Voltage, type = "l", ylab = "Voltage")

plot(datetime, powerSubData$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")

points(datetime, powerSubData$Sub_metering_2, type = "l", col = "red")

points(datetime, powerSubData$Sub_metering_3, type = "l", col = "blue")

legend("topright",lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

plot(datetime, powerSubData$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power")

# close graphics device
dev.off()