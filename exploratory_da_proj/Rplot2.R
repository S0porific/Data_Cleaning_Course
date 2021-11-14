### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Calculate Agreegate 
city = NEI[NEI$fips == "24510",]
emission <- aggregate(city$Emissions, by=list(city$year), FUN=sum)
names(emission)[1] <- 'Year'
png("Rplot2.png")
barplot(emission$x,
        emission$Year,
        xlab = 'Year',
        ylab = 'PM 2.5',
        main = 'Plot of total Emission of Baltimore', ylim = c(0, 4000),
        names.arg = emission$Year)


dev.off()

