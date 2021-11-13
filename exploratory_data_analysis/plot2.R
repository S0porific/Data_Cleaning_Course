library('plotly')
x <- read.csv('household_power_consumption.txt', sep=';')
x$format_date <- as.POSIXlt(x$Date, format='%d/%m/%Y')

datarange <- "&"((as.POSIXlt('08-02-2007', format='%d-%m-%Y') <= x$format_date), 
                 (x$format_date < as.POSIXlt('10-02-2007', format='%d-%m-%Y')))
slicedData <- x[datarange,]

png("plot2.png", width=480, height=480)
plot(y= as.numeric(slicedData$Global_active_power),  type='l',
     x= (strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")), 
     col='red', ylab = 'Global Active Power(in KW)', xlab = "Day")

dev.off()