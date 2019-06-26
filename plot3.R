

## set the working directory 
setwd("C:/Users/va18755/Documents/Version/Git/")

## reading the file
a <-read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

## converting the date column for factor to date for subsetting
a$Date = dmy(as.character(a$Date))

## subsetting the date column
b <- subset(a, a$Date>= as.Date("2007-02-01") & a$Date <= as.Date("2007-02-02"))

## png driver intitiation
png(file = "plot3.png", width = 480, height = 480)

## plotting the graph
plot (b$datetime ,as.numeric(as.character(b$Sub_metering_1)), type = "l" , xlab = "", ylab = 
        "Energy sub metering")

## using lines to add more figures in the same graph

lines(b$datetime ,as.numeric(as.character(b$Sub_metering_2)),col = "red")
lines(b$datetime ,as.numeric(as.character(b$Sub_metering_3)), col = "blue")

##Using legends to annotate the graph
legend("topright", col = c("black","red","blue"), lty =1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
