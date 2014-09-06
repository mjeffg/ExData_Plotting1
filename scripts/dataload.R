###############################################################################
# Script for downloading and unzipping files in R adapted from Michael        #
#              Koohafkan's blog: "The Research blog of Michael Koohafkan:     # 
#              Downloading, extracting and reading files into R"              #
#              Posted on http://www.ocf.berkeley.edu/~mikeck/?p=688           #
#              February 12, 2014                                              #
################################################################################

# Check to see if data folder exist in working directory
# If not then create the folder
if( !file.exists("./data")) {dir.create("./data")}

# Create a variable "fileUrl" and assign the data Url address to it
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# create a temporary directory
td <- "./data"

# create the  temporary placeholder file
tf <- tempfile(tmpdir=td, fileext=".zip")

# download into the placeholder file
download.file(fileUrl, tf)

# Assign the full name of data to variable fname
fname <- "household_power_consumption.txt"

# unzip the file to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname)

# Read data into R and assign it to variable called "powerData"
powerData = read.table(fpath, header=TRUE, sep=";", row.names=NULL, 
             stringsAsFactors=FALSE)

# Format the Date variable to Date class
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y") 

# Set date parameters for the subset of the data(2/1/2007 - 2/2/2007)
date1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
date2 <- as.Date("2007-02-02", format = "%Y-%m-%d")

# Subset the data
powerSubData <- powerData[(powerData$Date >= date1) & (powerData$Date <= date2), ]

# Check to see if subset is correct
str(powerSubData)