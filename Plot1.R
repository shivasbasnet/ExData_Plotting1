#Home work 1
# Plot 1
# Read data from the file

library(dplyr) # 


# loading data as a data frame
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")

head(mydata) # to see first few lines of the data

str(mydata)
# subseting required data rows for the requied date
mysubset<-subset(mydata, (Date=="1/2/2007") | (Date=="2/2/2007"))

# create a png plot

png(filename = "plot1.png",width = 480, height = 480)

hist(mysubset$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

