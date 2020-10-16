png(filename = "plot3.png")

plot(DateTime, HousePowerCon$Sub.Metering...1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, HousePowerCon$Sub.Metering...2, col = "red")
lines(DateTime, HousePowerCon$Sub.Metering...3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch=c("_","_","_"), col = c("black","red","blue"))

dev.off()