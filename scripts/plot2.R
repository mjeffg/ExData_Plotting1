# Exploratory Data Analysis: Project 1
# Plot 2

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

# Create a plot on png graphics device
png(file = "plot2.png", width = 480, height = 480)

# Plot household global minute-averaged active power (in kilowatt)
#       across 2 days (2/1/2007 - 2/1/2007)
# Label the y-axis "Global active power(kilowatts)"
plot(datetime, powerSubData$Global_active_power, type = "l", xlab = "",  
        ylab = "Global active power(kilowatts)")

# turn png device off
dev.off()
