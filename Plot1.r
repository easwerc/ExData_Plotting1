#################  Exploratory Data Analysis    ###################

## Course Project 1

setwd("D:\\R-work\\CourseraR\\ExData_Plotting1\\")

# Get the data 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- tempfile()

download.file(url, zipfile)

#household_power <- read.table(unz(zipfile, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings = "?")
household_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
unlink(zipfile)

#Convert the Date and Time variables to Date/Time classes
#and Filter data to dates between 2007-02-01 and 2007-02-02 

household_power$Date <- as.Date(household_power$Date, "%d/%m/%Y")
        
household_power_feb2007 <-subset(household_power, 
                                 household_power$Date >= as.Date("2007-02-01", "%Y-%m-%d") 
                                & household_power$Date <= as.Date("2007-02-02", "%Y-%m-%d"))

household_power_feb2007$Time <- strptime(household_power_feb2007$Time, "%H:%M:%S")

png(filename="plot1.png", width=480, height=480, units="px")
hist(household_power_feb2007$Global_active_power
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , col="red")

dev.off()

################################### END ########################################
