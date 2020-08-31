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
hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     col = "red")
dev.copy(png, file = "plot1.png") #Create PNG file
dev.off() #Close graphic device