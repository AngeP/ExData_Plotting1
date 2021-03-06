## Plot4

## Read data  Electric power consumption from text file
x <- read.table(choose.files(),sep = ";", header=T)

## Subset for dates 2007-02-01 to 2007-02-02
x2 <- x[x[,1] %in% c("1/2/2007", "2/2/2007"),]
 
## Including datetime column
x2$Datetime <- strptime(paste(plotdata$Date, plotdata$Time) , "%d/%m/%Y %H:%M:%S")
 
## Create Plot4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
## Top left plot
plot(x2$Datetime,as.numeric(as.character(x2$Global_active_power)),type = "l",xlab = "",ylab = "Global Active Power")
## Top right plot
plot(x2$Datetime,as.numeric(as.character(x2$Voltage)),type = "l",xlab = "datetime",ylab = "Voltage")
## Bottom left plot
plot(x2$Datetime,as.numeric(as.character(x2$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(x2$Datetime,as.numeric(as.character(x2$Sub_metering_2)), type = "l", col = "red")
lines(x2$Datetime,as.numeric(as.character(x2$Sub_metering_3)), type = "l", col = "blue")
legend('topright', names(x2)[7:9], lty = 1, col = c("black","red", "blue"), bty = 'n')
## Bottom right plot
plot(x2$Datetime,as.numeric(as.character(x2$Global_reactive_power)),type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off() 