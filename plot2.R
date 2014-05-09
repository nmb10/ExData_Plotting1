Sys.setlocale("LC_TIME", "C")

file_name <- "household_power_consumption.txt"

# small file needs to debug and test plot
# file_name <- "household_power_consumption_small.txt"

# read file
df <- read.csv(file_name, sep=";", stringsAsFactors=FALSE)

# get only 2007-02-01 and 2007-02-02
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# remove question marks
df <- df[df$Global_active_power != "?", ]

# convert to numbers
df$Global_active_power <- as.numeric(df$Global_active_power)

# join date and time to another column
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S", tz="CEST")

# open png device
png(file="plot2.png", width=480, height=480)

# plot
plot(df$DateTime, df$Global_active_power, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

# close png file device
dev.off()

