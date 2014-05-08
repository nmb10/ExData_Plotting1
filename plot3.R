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

# open png device
png(file="plot3.png", width=480, height=480, bg="transparent") 

# plot
plot(df$DateTime, df$Sub_metering_1, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

# add sub metering lines
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")

# add legend
legend("topright", cex=0.7, lty=1, col=c("black", "red", "blue"),
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close png file device
dev.off()

