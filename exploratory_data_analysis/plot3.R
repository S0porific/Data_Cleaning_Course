library('plotly')
x <- read.csv('household_power_consumption.txt', sep=';')
x$format_date <- as.POSIXlt(x$Date, format='%d/%m/%Y')

datarange <- "&"((as.POSIXlt('08-02-2007', format='%d-%m-%Y') <= x$format_date), 
                 (x$format_date < as.POSIXlt('10-02-2007', format='%d-%m-%Y')))
slicedData <- x[datarange,]

png("plot3.png", width=480, height=480)
plot(y= as.numeric(slicedData$Sub_metering_1),  type='l',
     x= (strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")), 
     col='red', ylab = 'Energy Sub Metering', xlab = "Day")
lines(y= as.numeric(slicedData$Sub_metering_2), x= (strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")))
lines(y= as.numeric(slicedData$Sub_metering_3), x= (strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")),
      col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("red", "black", "blue"))
dev.off()