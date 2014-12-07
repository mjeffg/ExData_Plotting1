# Exploratory Data Analysis: Project 1
# Plot 1


# Read data into R and assign it to variable called "powerData"
powerData = read.table("./data/household_power_consumption.txt", header=TRUE, 
                       sep=";", row.names=NULL, 
                       stringsAsFactors=FALSE)

# Create plot on png file device
png(file = "plot1.png", width = 480, height = 480)

# Format the Date variable to Date class
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y") 

# Set date parameters for the subset of the data(2/1/2007 - 2/2/2007)
date1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
date2 <- as.Date("2007-02-02", format = "%Y-%m-%d")

# Subset the data
powerSubData <- powerData[(powerData$Date >= date1) & (powerData$Date <= date2), ]

# Transform Global_active_power variable from character class to 
#       numeric for histogram
globalActivePower <- (as.numeric(powerSubData$Global_active_power))

# Plot a histogram of household global minute-averaged active power (in kilowatt)
# Label the x-axis "Global active power(kilowatts) and title the histogram
#       "Global active power"
hist(globalActivePower, col = "red", xlab = "Global active power(kilowatts)", 
        main = "Global active power")

# Turn the graphics device off
dev.off()

