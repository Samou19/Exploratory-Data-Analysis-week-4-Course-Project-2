
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

## Assignment #Q2: Have total emissions from PM2.5 decreased in the Baltimore 
## City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
## system to make a plot answering this question.

DataSub <- subset(NEI, fips == "24510")
BaltCnty <- tapply(DataSub$Emissions, DataSub$year, sum)

png("Plot2.png",width=500,height=480)

plot(BaltCnty, type = "o", main = "Total PM2.5 Emissions in Baltimore County", 
     xlab = "Year", ylab = "PM2.5 Emissions", pch = 18, col = "green", 
     lty = 5)

dev.off()