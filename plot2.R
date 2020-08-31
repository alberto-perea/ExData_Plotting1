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

plot(df$Time, df$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480) #Create PNG file
dev.off() #Close graphic device