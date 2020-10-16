make.my.graphs <-  function(){
setClass("myDate")

setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

HousePowerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("Date"
                              ,"Time","Global Active Power", "Global Reactive Power","Voltage","Global Intensity"
                              , "Sub Metering - 1", "Sub Metering - 2", "Sub Metering - 3"), na.string = "?"
                              , colClasses = c(Date = "myDate"), nrows = (69516L - 66636L), skip = 66636L)

png(filename = "plot1.png")

hist(HousePowerCon$Global.Active.Power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()

DateTime <- as.POSIXlt(paste(HousePowerCon$Date, HousePowerCon$Time, sep = " "))

png(filename = "plot2.png")

plot(DateTime, HousePowerCon$Global.Active.Power, type = "l")

dev.off()

png(filename = "plot3.png")

plot(DateTime, HousePowerCon$Sub.Metering...1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, HousePowerCon$Sub.Metering...2, col = "red")
lines(DateTime, HousePowerCon$Sub.Metering...3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch=c("_","_","_"), col = c("black","red","blue"))

dev.off()

png(filename = "plot4.png")

par(mfrow = c(2,2), mar = c(4,4,1,4))

with(HousePowerCon, plot(DateTime, Global.Active.Power, type = "l", xlab = "Date/Time", ylab = "Global Active Power"))

with(HousePowerCon, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "Date/Time"))

with(HousePowerCon, plot(DateTime, HousePowerCon$Sub.Metering...1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(DateTime, HousePowerCon$Sub.Metering...2, col = "red")
lines(DateTime, HousePowerCon$Sub.Metering...3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch=c("_","_","_"), col = c("black","red","blue"))

with(HousePowerCon, plot(DateTime, Global.Reactive.Power, type = "l", ylab = "Global Reactive Power", xlab = "Date/Time"))

dev.off()
}

