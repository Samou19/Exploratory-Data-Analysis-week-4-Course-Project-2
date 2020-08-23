
if (!file.exists("data")){
  dir.create("data")
}

adres <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(adres, destfile = "./data/exdata%2Fdata%2FNEI_data.zip", method = "auto")
#unzip the dataset
unzip("./data/exdata%2Fdata%2FNEI_data.zip", exdir = "./data")
list.files("./data")

## load data
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Assignment #Q5: How have emissions from motor vehicle sources changed 
## from 1999-2008 in Baltimore City? 
##

Vhcls <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
VhclsSCC <- SCC[Vhcls,]$SCC
VhclsNEI <- NEI[NEI$SCC %in% VhclsSCC,]
baltimoreVhclsNEI <- VhclsNEI[VhclsNEI$fips==24510,]

library(ggplot2)

png("Plot5.png",width=500,height=400,units="px",bg="transparent")

g <- ggplot(baltimoreVhclsNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(g)
dev.off() 