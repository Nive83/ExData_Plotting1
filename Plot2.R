datar<-read.table("household_power_consumption.txt",skip=1,sep=";")##Reading Data from the text file
names(datar)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")## Assign column names
date<-datar[datar$Date %in% c("01/02/2007","02/02/2007"),] ## Subsetting data for 2 days

gloactpower<-as.numeric(date$Global_active_power)## change datatype

## Formattind date and time variables
date$Date <- as.Date(date$Date, format="%d/%m/%Y")
date$Time <- strptime(date$Time, format="%H:%M:%S")
date[1:1440,"Time"] <- format(date[1:1440,"Time"],"2007-02-01 %H:%M:%S")
date[1441:2880,"Time"] <- format(date[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("Plot2.png",width=480,height=480)## Open png file in WD
plot(date$Time,gloactpower,type="l",xlab="",ylab="Global Active Power (kilowatt)")## Declare plot function
dev.off()## close the png device
