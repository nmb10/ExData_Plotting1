Sys.setlocale("LC_TIME", "C")

file_name <- "household_power_consumption.txt"

# small file needs to debug and test plot
# file_name <- "household_power_consumption_small.txt"

# read file
df <- read.csv(file_name, sep=";", stringsAsFactors=FALSE)

# get only 2007-02-01 and 2007-02-02
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# join date and time to another column
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S", tz="CEST")

# remove question marks
df <- df[df$Global_active_power != "?", ]

# convert to numbers
df$Global_active_power <- as.numeric(df$Global_active_power)

# open png device
png(file="plot4.png", width=480, height=480, bg="transparent") 

par(mfrow=c(2, 2), mar=c(5, 4, 2, 1))

# plot1
plot(df$DateTime, df$Global_active_power, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

# plot2
plot(df$DateTime, df$Voltage, type="l",
    xlab="datetime", ylab="Voltage")

# plot3
plot(df$DateTime, df$Sub_metering_1, type="l",
    ylab="Energy sub metering", xlab="")

# add sub metering lines to plot3
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")

# add legend to plot3
legend("topright", cex=0.7, lty=1, col=c("black", "red", "blue"),
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot4
plot(df$DateTime, df$Global_reactive_power, type="l",
    xlab="datetime", ylab="Global_reactive_power")

# close png file device
dev.off()

