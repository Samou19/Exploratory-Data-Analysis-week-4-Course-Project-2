
if (!file.exists("data")){
  dir.create("data")
}

adres <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(adres, destfile = "./data/exdata%2Fdata%2FNEI_data.zip", method = "auto")
#unzip the dataset
unzip("./data/exdata%2Fdata%2FNEI_data.zip", exdir = "./data")
list.files("./data")

## load data
NEI <- readRDS("./data/summarySCC_PM25.rds")

## Assignment #Q3: Of the four types of sources indicated by the type (point, 
## nonpoint, onroad, nonroad) variable, which of these four sources have seen 
## decreases in emissions from 1999-2008 for Baltimore City? Which have seen 
## increases in emissions from 1999-2008? Use the ggplot2 plotting system to 
## make a plot answer this question.

library(ggplot2)

baltimoreNEI <- NEI[NEI$fips=="24510",]

png("Plot3.png",width=550,height=450)

g <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(g)
dev.off()