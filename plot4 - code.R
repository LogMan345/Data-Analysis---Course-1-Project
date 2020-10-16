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