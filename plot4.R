#Read the whole text file subset the data frame to
#dates between 2007/02/01 and 2007/02/02
df <- read.table("./data/household_power_consumption.txt",
                 sep = ";",
                 header = TRUE, 
                 na.strings = "?")
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
#Transform dates and times
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

#CREATE PLOT
#Modify mfrow parameter
par(mfrow = c(2,2))

#PLOT Global active power VS time
plot(df$Time, df$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power")

#PLOT Voltage VS datetime
plot(df$Time, df$Voltage,
     type = "l",
     main = "",
     xlab = "datetime",
     ylab = "Voltage")

#PLOT Sub metering VS time
plot(df$Time, df$Sub_metering_1, 
     type = "l",
     main = "",
     xlab = "",
     ylab = "Energy sub metering") 
lines(df$Time, df$Sub_metering_2, type = "l", col = "red")  #Sub_metering_2 plot
lines(df$Time, df$Sub_metering_3, type = "l", col = "blue") #Sub_metering_3 plot
#Add Legend
legend("topright",  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"),
       lty = 1,
       bty = "n")

#PLOT Global reactive power VS datetime
plot(df$Time, df$Global_reactive_power,
     type = "l",
     main = "",
     xlab = "datetime",
     ylab = "Global_reactive_power")

#Copy graphic device to PNG file
dev.copy(png, file = "plot4.png") #Create PNG file
dev.off() #Close graphic device