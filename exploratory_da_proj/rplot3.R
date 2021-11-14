library('ggplot2')
library('dplyr')
### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Calculate Agreegate 
city = NEI[NEI$fips == "24510",]

  # xlab("Year") +
  # ylab("log PM2.5 emissions") +
  # ggtitle("PM 2.5 emission from 1998 to 2008 per type\n Baltimore City, MD") +
  # geom_jitter(alpha=0.1) +
  # geom_boxplot() +
  # labs(fill = "Type") +
  # facet_grid(. ~ type)
t = city %>% group_by(type, year) %>% summarise(Esum = sum(Emissions))
png('Rplot3.png')
ggplot(t, mapping = aes(x=as.factor(year), y=Esum,fill=type))+geom_bar(stat="identity",position=position_dodge(3)) + facet_grid(. ~ type)  + xlab("Year wise data") + ylab('Total Emission')
dev.off()