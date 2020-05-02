
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

str(mysubset)


# Create a png file devcice

png(filename = "plot3.png",width = 480, height = 480)

# Creating a plot

with(mysubset, {
  plot(Day, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
  lines(Day, Sub_metering_1, lty=1, col="black")
  lines(Day, Sub_metering_2, lty=1, col="red")
  lines(Day, Sub_metering_3, lty=1, col="blue")
  legend("topright", lty = c(1), cex = 1, col = c("black", "red"), legend = c(names(mysubset[7:9])))
  
})   

dev.off()


