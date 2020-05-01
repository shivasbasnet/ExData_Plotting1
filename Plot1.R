#Home work 1
# Plot 1
# Read data from the file

library(dplyr)

mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

head(mydata)

mysubset<-subset(mydata, (Date=="2/1/2007") | (Date=="2/2/2007"))

mysubset<- mutate(mysubset, GAP=as.numeric(Global_active_power))


png(filename = "plot1.png",width = 480, height = 480)

hist(mysubset$GAP, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")


dev.off()




