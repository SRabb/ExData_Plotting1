##Load as given, then add the date
data <-read.table("household_power_consumption.txt", sep=";", colClasses = c("factor","factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header=TRUE, na.strings = "?")
str(data)
withDate <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 
withDate$datetime<-as.POSIXct(paste(withDate$Date,withDate$Time), format="%d/%m/%Y %H:%M:%S")

## draw plot 2
png("plot2.png")
plot(withDate$datetime,withDate$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
