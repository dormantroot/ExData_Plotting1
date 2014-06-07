###############################################################################
## plot2.R script file
###############################################################################
## This script creates a line graph representing the 'Global_active_power' 
## variable value for each day of the week, during the 1st and 2nd day of 
## February, 2007. The resulting line graph is saved in the current 
## working folder as plot2.png
###############################################################################


##-----------------------------------------------------------------------------
## Pre-requisites before running the entire script.
##
## 1) Please set your working directory (using the 'setwd' command) to the 
##    location of the required file - 'household_power_consumption.txt'.
##
## 2) You should install the 'sqldf' R package
##-----------------------------------------------------------------------------
library(sqldf)  # load sqldf library

getwd()         # get your current working location
#setwd(.....)   # command to set your working directory location. Note, the directory should contain the 'household_power_consumption.txt' file


# Read only those recordings that happened on February 1st and 2nd of year 2007.
data = read.csv.sql("household_power_consumption.txt", sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007' ", 
                    sep=";", header=TRUE)

# Define the plotting device
png("plot2.png",res=55, width=480, height=480) 

# Create a line plot showing the values of the variable -'Global_active_power'
plot(data$Global_active_power,type="l",lwd=1,
     xaxt="n",col="black",
     xlab="",ylab="Global Active Power (kilowatts)",
     main="")
axis(1, at=1,labels=c("Thu"))
axis(1, at=length(data$Date)/2,labels=c("Fri"))
axis(1, at=length(data$Date),labels=c("Sat"))

# Save to PNG file
dev.off()
