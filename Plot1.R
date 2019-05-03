datar<-read.table("household_power_consumption.txt",skip=1,sep=";")## Reading data from text file
names(datar)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")## assign column names
date<-datar[datar$Date %in% c("01/02/2007","02/02/2007"),]## subsetting data for 2 days

gloactpower<-as.numeric(date$Global_active_power)## change datatype

png("Plot1.png",width = 480,height = 480)## open png file in working directory
hist(gloactpower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatt)")##declare base plot function
dev.off()## close the png device
