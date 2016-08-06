## plot1.R
## This script produces a PNG file historgram of electric power consumption data.
## 
powFile <- "household_power_consumption.txt"
if (!file.exists(powFile)){
    powerUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(powerUrl,"powerData.zip", method='curl')  
    unzip("powerData.zip")
}

powData <- read.csv(powFile, header = FALSE, sep=";",na.strings = "?", 
                     skip=66637, nrows = 2880)

powData$V1 <- strptime(paste(powData$V1,powData$V2), format="%d/%m/%Y %H:%M:%S")

png(file="plot1.png",width=480, height = 480)
hist(powData$V3,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


