### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

selectedYear <- c(1999, 2002, 2005, 2008)

# Calculate Agreegate 
emission <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(emission)[1] <- 'Year'
png("Rplot1.png")
barplot(emission$x,
        emission$Year,
        xlab = 'Year',
        ylab = 'PM 2.5',
        main = 'Plot of total Emission', ylim = c(0, 8e6),
        names.arg = emission$Year)

dev.off
