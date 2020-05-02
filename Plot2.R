
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

png(filename = "plot2.png",width = 480, height = 480)

with(mysubset, plot(Day, Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)"))

dev.off()

