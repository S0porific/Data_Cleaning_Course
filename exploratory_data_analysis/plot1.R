library('plotly')
x <- read.csv('household_power_consumption.txt', sep=';')
x$format_date <- as.POSIXlt(x$Date, format='%d/%m/%Y')

datarange <- "&"((as.POSIXlt('08-02-2007', format='%d-%m-%Y') < x$format_date), 
                 (x$format_date < as.POSIXlt('10-02-2007', format='%d-%m-%Y')))
slicedData <- x[datarange,]

png("plot1.png", width=480, height=480)
hist(as.numeric(slicedData$Global_active_power), 
     col='red', xlab = 'Global Active Power(in KW)', ylab = 'Frequency', 
      main = 'Global Active Power')

dev.off()