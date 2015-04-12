datafile <- "household_power_consumption.txt"
destfilename <- "exdata-data-household_power_consumption.zip"

# Download data file
if (!file.exists(datafile)) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = destfilename,
                mode = "wb")
        unzip(destfilename)
}

# will read approximately 2 months from Dec 16, 2006 to Feb 15, 2007
num_obs <- 2 * 30 * 24 * 60
df <- read.csv2(datafile, 
                 nrows = num_obs, 
                 colClasses = c(rep('character',2),rep('numeric',7)), 
                 na.strings = "?", 
                 dec = ".")

# select data for the 2 days we need
data <- df[which(df$Date == '1/2/2007' | df$Date == '2/2/2007'),]

# play around with margins to show the x, y axis/labels
par(mar = c(4, 4, 1, 2))

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, filename = "plot1.png", height = 480, width = 480)
dev.off()