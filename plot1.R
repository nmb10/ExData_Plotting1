file_name <- "household_power_consumption.txt"

# small file needs to debug and test plot
# file_name <- "household_power_consumption_small.txt"

# read file
df <- read.csv(file_name, sep=";", stringsAsFactors=FALSE)

# get only 2007-02-01 and 2007-02-02
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# remove question marks
active_power <- df$Global_active_power[df$Global_active_power != "?"]

# convert to numbers
active_power <- as.numeric(active_power)
    
# open png device
png(file="plot1.png", width=480, height=480)

# create graph
hist(active_power, col="red", main="Global Active Power",
    xlab="Global Active Power (kilowatts)")

# close png file device
dev.off()

