#################  Exploratory Data Analysis    ###################

## Course Project 1 - Plot 3
# Clean up workspace and set the working directory
rm(list=ls())
setwd("D:\\R-work\\CourseraR\\ExData_Plotting1\\")

# Get the data 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- tempfile()

download.file(url, zipfile)

household_power <- read.table(unz(zipfile, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings = "?")
#household_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
unlink(zipfile)

#Convert the Date and Time variables to a new column of DateTime POSIXlt class
#and Filter data to dates between 2007-02-01 and 2007-02-02 

household_power$DateTime <- strptime(paste(household_power$Date, household_power$Time, sep=" ")
                                    , format="%d/%m/%Y %H:%M:%S")
        
household_power_feb2007 <-subset(household_power, 
                                 household_power$DateTime >= as.POSIXlt("2007-02-01 00:00:00", "%Y-%m-%d") 
                                & household_power$DateTime <= as.POSIXlt("2007-02-02 23:59:59", "%Y-%m-%d"))


png(filename="plot3.png", width=480, height=480, units="px")
with(household_power_feb2007, plot(DateTime
     , Sub_metering_1
     , type="l"
     , main=""
     , xlab=""
     , ylab="Energy sub metering")
     )

with(household_power_feb2007, points(DateTime
     , Sub_metering_2
     , type="l"
     , col="red")
     )

with(household_power_feb2007, points(DateTime
     , Sub_metering_3
     , type="l"
     , col="blue")
     )

legend("topright", lty=1, col=c("black","blue","red")
        , legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

################################### END ########################################
