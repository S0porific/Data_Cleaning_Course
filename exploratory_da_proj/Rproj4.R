library('ggplot2')
library('dplyr')
### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# selected all the SCC which has a mention of coal
coalOnly <- SCC[grep("(coal|Coal)", SCC$Short.Name,ignore.case = TRUE),]

# filter the relevant rows from the NEI dataset 

NEIfilterd <- NEI[NEI$SCC %in% coalOnly$SCC,]

emission <- aggregate(NEIfilterd$Emissions, by=list(NEIfilterd$year), FUN=sum)
names(emission)[1] <- 'Year'
png('Rplot4.png')
barplot(emission$x,
        emission$Year,
        xlab = 'Year',
        ylab = 'Total Emission',
        main = 'Plot of total Emission from Coal',
        names.arg = emission$Year)
dev.off()