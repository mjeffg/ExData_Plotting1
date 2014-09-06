# Exploratory Data Analysis: Project 1
# Plot 2

# Load data into R by sourcing the "dataload.R" script
source("./dataload.R")


# Merge variables Date & Time and use strptime to format as Posixlt class
date <- powerSubData$Date
time <- powerSubData$Time
dateTimeChar <- (paste(date, time, sep = " "))
datetime <- (strptime(dateTimeChar, format = "%Y-%m-%d %H:%M:%S"))

# Create a plot on png graphics device
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

# Plot household global minute-averaged active power (in kilowatt)
#       across 2 days (2/1/2007 - 2/1/2007)
# Label the y-axis "Global active power(kilowatts)"
plot(datetime, powerSubData$Global_active_power, type = "l", xlab = "",  
        ylab = "Global active power(kilowatts)")

# turn png device off
dev.off()
