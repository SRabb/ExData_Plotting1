##Load as given, then add the date
data <-read.table("household_power_consumption.txt", sep=";", colClasses = c("factor","factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header=TRUE, na.strings = "?")
str(withDate)
withDate <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 
withDate$datetime<-as.POSIXct(paste(withDate$Date,withDate$Time), format="%d/%m/%Y %H:%M:%S")

##Mash up all the plots
png("plot4.png")
par(mfrow=c(2,2), mar =c(2,2,2,2))
plot(withDate$datetime,withDate$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
plot(withDate$datetime,withDate$Voltage,type="l",xlab="", ylab="Voltage")
plot(withDate$datetime,withDate$Sub_metering_1,type="l",xlab=" ",ylab="Energy Sub Metering",ylim=c(0,40))
lines(withDate$datetime,y=withDate$Sub_metering_2,ylim=c(0,40),col="red")
lines(withDate$datetime,y=withDate$Sub_metering_3,ylim=c(0,40),col="blue")
legend("topright", cex=0.95, bty="n", col = c("black", "red", "blue"), lty = c("solid", "solid", "solid"), legend = names(withDate[,7:9]))
plot(withDate$datetime,withDate$Global_reactive_power,type="l",xlab="", ylab="Global_reactive_power")

dev.off()