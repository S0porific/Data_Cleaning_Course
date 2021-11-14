library('ggplot2')
library('dplyr')
### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter city
city <- subset(NEI, fips %in% c("06037", "24510"))

# selected all the SCC which has a mention of motor
motorOnly <- SCC[grep("(motor)", SCC$Short.Name,ignore.case = TRUE),]

city <- city[city$SCC %in% motorOnly$SCC,]


t = city %>% group_by(year, fips) %>% summarise(Esum = sum(Emissions))

png('Rplot6.png')
ggplot(t, mapping = aes(x=as.factor(year), y=Esum,fill=fips))+
  geom_bar(stat="identity",position=position_dodge(3)) + 
  facet_grid(. ~ fips)  + 
  xlab("Year wise data") +
  ylab('Total Emission')
dev.off()