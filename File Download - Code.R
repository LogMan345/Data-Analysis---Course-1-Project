setClass("myDate")

setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

HousePowerCon <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("Date"
                             ,"Time","Global Active Power", "Global Reactive Power","Voltage","Global Intensity"
                             , "Sub Metering - 1", "Sub Metering - 2", "Sub Metering - 3"), na.string = "?"
                            , colClasses = c(Date = "myDate"), nrows = (69516L - 66636L), skip = 66636L)