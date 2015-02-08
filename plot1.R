## Plot1 
## Install package "sqldf" if not already installed
install.packages("sqldf")
library("sqldf")

## Read data  Electric power consumption from text file
x <- read.table(choose.files(),sep = ";", header=T)

## Subset for dates 2007-02-01 to 2007-02-02
x2 <- x[x[,1] %in% c("1/2/2007", "2/2/2007"),]
 
## Including datetime column
x2$Datetime <- strptime(paste(plotdata$Date, plotdata$Time) , "%d/%m/%Y %H:%M:%S")
 
## Create Plot1
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(x2$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col = "red")
dev.off()