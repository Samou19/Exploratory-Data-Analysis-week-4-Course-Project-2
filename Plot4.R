
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

## Assignment #Q4: Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999-2008?
##

SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

png("Plot4.png",width=400,height=400,units="px",bg="transparent")

g <- ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + 
  geom_bar(stat= "identity", width = .4) + xlab("year") +
  ylab("Coal-Related PM2.5 Emissions") + 
  ggtitle("Total Coal-Related PM2.5 Emissions")

print(g)
dev.off() 