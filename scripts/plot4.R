# Exploratory Data Analysis: Project 1
# Plot #3

# Load data into R by sourcing the "dataload.R" script
source("./dataload.R")

# Merge variables Date & Time and use strptime to format as Posixlt class
date <- powerSubData$Date
time <- powerSubData$Time
dateTimeChar <- (paste(date, time, sep = " "))
datetime <- (strptime(dateTimeChar, format = "%Y-%m-%d %H:%M:%S"))


# Create plot on png grapics device
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

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

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

plot(datetime, powerSubData$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power")

# close graphics device
dev.off()