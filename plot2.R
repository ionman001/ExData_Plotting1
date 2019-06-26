
## set the working directory 
setwd("C:/Users/va18755/Documents/Version/Git/")

## reading the file
a <-read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

## converting the date column for factor to date for subsetting
a$Date = dmy(as.character(a$Date))

## subsetting the date column
b <- subset(a, a$Date>= as.Date("2007-02-01") & a$Date <= as.Date("2007-02-02"))

## png driver intitiation
png(file = "plot2.png", width = 480, height = 480)

## New column date time is formed after merging the date and time variable
b$datetime <- paste(as.character(b$Date),as.character(b$Time))

## converting datetime to posixct format(i.e time format)
b$datetime <- as.POSIXct(b$datetime)

## plot
plot (b$datetime ,as.numeric(as.character(b$Global_active_power)), type = "l" , xlab = "", ylab = 
        "Global_active_power (kilowatts)")


dev.off()

