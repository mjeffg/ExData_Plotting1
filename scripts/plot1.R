# Exploratory Data Analysis: Project 1
# Plot 1

# Load data into R by sourcing the "dataload.R" script
source("./dataload.R")

# Create plot on png file device
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

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

