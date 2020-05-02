library(dplyr)
#library(chron)

# loading data as a data frame
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")

# subseting required data rows for the requied date
mysubset<-subset(mydata, (Date=="1/2/2007") | (Date=="2/2/2007"))

# to see the bottom few rows
tail(mysubset)
# to see the data type of subset
str(mysubset)

# convert the Date to Date type and store it in a new column 
mysubset<- mutate(mysubset, Date_date= as.Date(Date,  "%d/%m/%Y"))

# to see the data type of subset
str(mysubset)

# adding Day column in subset conver

mysubset$Day <- as.POSIXct(paste(mysubset$Date_date, mysubset$Time))

# to check the data type and Column DAy

str(mysubset)
# Create a png window 

png(filename = "plot4.png",width = 480, height = 480)

# for creating multiple plots
par(mfrow = c(2, 2), mar=c(5,4,1,1))
with(mysubset, {
   plot(Day, Global_active_power, type= "l", xlab= "",ylab = "Global Active Power")
   plot(Day, Voltage, type= "l", xlab= "datetime", ylab = "Voltage")
   plot(Day, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
        lines(Day, Sub_metering_1, lty=1, col="black")
        lines(Day, Sub_metering_2, lty=1, col="red")
        lines(Day, Sub_metering_3, lty=1, col="blue")
        legend("topright", lty = c(1), cex = 1, col = c("black", "red"), legend = c(names(mysubset[7:9])))
  
  plot(Day, Global_reactive_power, type= "l", xlab= "datetime",ylab = "Global_reactive_power", ylim =c(0,0.5))
})   
# to close the plot window
dev.off()
