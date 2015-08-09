power_consumption = read.table("household_power_consumption.txt", sep=";", skip=1, na.strings = "?",
                               col.names = c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
                               colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

febdays <- subset(power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- strptime(paste(febdays$Date, febdays$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

par(mfrow=c(2,2))

# global active power
plot(datetime, febdays$Global.Active.Power, type="l", ylab="Global Active Power", xlab="")

# voltage
plot(datetime, febdays$Voltage, type="l", ylab="Voltage")

# sub-metering
plot(datetime, febdays$Sub.Metering.1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, febdays$Sub.Metering.2, type="l", col="red")
lines(datetime, febdays$Sub.Metering.3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, cex=.8, bty="n")

# global reactive power
plot(datetime, febdays$Global.Reactive.Power, type="l", ylab="Global_reactive_power", cex.axis=.6)

# Save plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
