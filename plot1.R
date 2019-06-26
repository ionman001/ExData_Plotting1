

## set the working directory 
setwd("C:/Users/va18755/Documents/Version/Git/")

## reading the file
a <-read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

## converting the date column for factor to date for subsetting
a$Date = dmy(as.character(a$Date))

## subsetting the date column
b <- subset(a, a$Date>= as.Date("2007-02-01") & a$Date <= as.Date("2007-02-02"))

## png driver intitiation
png(file = "plot1.png", width = 480, height = 480)

hist(as.numeric(as.character(b$Global_active_power)), col = "red", xlab = "Global_active_power (kilowatts)", 
     main = "Global Active Power")

dev.off()

