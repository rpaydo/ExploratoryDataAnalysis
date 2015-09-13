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

##Plot histogram of Global active power data.

hist(plotdata$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")

##Export copy of plot to working directory.

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()