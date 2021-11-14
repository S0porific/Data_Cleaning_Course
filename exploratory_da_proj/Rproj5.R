library('ggplot2')
library('dplyr')
### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Calculate Agreegate 
city = NEI[NEI$fips == "24510",]

# selected all the SCC which has a mention of motor
motorOnly <- SCC[grep("(motor)", SCC$Short.Name,ignore.case = TRUE),]

city <- city[city$SCC %in% motorOnly$SCC,]

emission <- aggregate(city$Emissions, by=list(city$year), FUN=sum)
names(emission)[1] <- 'Year'
png('Rplot5.png')
barplot(emission$x,
        emission$Year,
        xlab = 'Year',
        ylab = 'Total Emission',
        main = 'Plot of total Emission from Motor Vehicle',
        names.arg = emission$Year)
dev.off()