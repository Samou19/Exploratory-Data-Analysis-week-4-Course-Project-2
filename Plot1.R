# Course EXploratory Data Analysis week 4 project 2

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

## Assignment #Q1:  Have total emissions from PM2.5 decreased in the United  
## States from 1999 to 2008? Using the base plotting system, make a plot showing  
## the total PM2.5 emission from all sources for each of the years 1999, 2002, 
## 2005, and 2008.

Emi_PM2.5 <- with(NEI, aggregate(Emissions, by = list(year), sum))

png("Plot1.png",width=480,height=480)

plot(Emi_PM2.5, type = "o", main = "Total PM2.5 Emissions", xlab = "Year", 
     ylab = "PM2.5 Emissions", pch = 19, col = "green", lty = 6)

dev.off()