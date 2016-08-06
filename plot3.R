## plot3.R
## This script produces a PNG file line graph of electric power consumption data.
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


png(file="plot3.png",width=480, height = 480)
plot(powData$V1, powData$V7, type="l", xlab="", 
     ylab="Energy sub metering")
points(powData$V1, powData$V8,type ="l",col="red")
points(powData$V1, powData$V9,type ="l",col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:1)
dev.off()
