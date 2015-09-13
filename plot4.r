##Import file from working directory

power=read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", 
                 stringsAsFactors=FALSE)

##Convert Date variable to date format.

power$Date=as.Date(power$Date,format="%d/%m/%Y")

##Subset to select only data from 2/1/07 and 2/2/07.

plotdata=subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")

##Combine date and time columns and convert to POSIT.

plotdata$DateTime=paste(plotdata$Date,plotdata$Time)
plotdata$DateTime=as.POSIXct(plotdata$DateTime)

##Plot runcharts of sub metering data in working directory.

png(filename="plot4.png")

par(mfcol=c(2,2))
plot(plotdata$Global_active_power~plotdata$DateTime,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
plot(plotdata$Sub_metering_1~plotdata$DateTime,type="l",xlab="",
     ylab="Energy Sub Metering")
lines(plotdata$Sub_metering_2~plotdata$DateTime,col="red")
lines(plotdata$Sub_metering_3~plotdata$DateTime,col="blue")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
plot(plotdata$Voltage~plotdata$DateTime,type="l",xlab="datetime",ylab="Voltage")
plot(plotdata$Global_reactive_power~plotdata$DateTime,type="l",xlab="datetime",
     ylab="Global_reactive_power")


dev.off()