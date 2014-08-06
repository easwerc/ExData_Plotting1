#################  Exploratory Data Analysis    ###################

## Course Project 1 - Plot 2

#setwd("D:\\R-work\\CourseraR\\ExData_Plotting1\\")

# Get the data 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- tempfile()

download.file(url, zipfile)

household_power <- read.table(unz(zipfile, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings = "?")
unlink(zipfile)

#Convert the Date and Time variables to a new column of DateTime POSIXlt class
#and Filter data to dates between 2007-02-01 and 2007-02-02 

household_power$DateTime <- strptime(paste(household_power$Date, household_power$Time, sep=" ")
                                    , format="%d/%m/%Y %H:%M:%S")
        
household_power_feb2007 <-subset(household_power, 
                                 household_power$DateTime >= as.POSIXlt("2007-02-01 00:00:00", "%Y-%m-%d") 
                                & household_power$DateTime <= as.POSIXlt("2007-02-02 23:59:59", "%Y-%m-%d"))

#household_power_feb2007$Time <- strptime(household_power_feb2007$Time, "%H:%M:%S")

png(filename="plot2.png", width=480, height=480, units="px")
plot(household_power_feb2007$DateTime
     , household_power_feb2007$Global_active_power
     , type="l"
     , main=""
     , xlab=""
     , ylab="Global Active Power (kilowatts)")

dev.off()

################################### END ########################################
