datar<-read.table("household_power_consumption.txt",skip=1,sep=";")##Read data from text file
names(datar)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")## Assign column names
date<-datar[datar$Date %in% c("01/02/2007","02/02/2007"),]## Subsetting data for 2 days

## formatting date and time variables
date$Date <- as.Date(date$Date, format="%d/%m/%Y")
date$Time <- strptime(date$Time, format="%H:%M:%S")
date[1:1440,"Time"] <- format(date[1:1440,"Time"],"2007-02-01 %H:%M:%S")
date[1441:2880,"Time"] <- format(date[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("Plot3.png",width=480,height = 480)##Open Png file in WC
##Do plotting function
plot(date$Time,date$Sub_metering_1,type = "n",xlab = "",ylab="Energy Sub Metering")
with(date,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(date,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(date,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))## Annotating the graph
dev.off()##Close the png device
