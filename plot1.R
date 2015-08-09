power_consumption = read.table("household_power_consumption.txt", sep=";", skip=1, na.strings = "?",
                               col.names = c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
                               colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
febdays <- subset(power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

hist(febdays$Global.Active.Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

