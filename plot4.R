setwd("~/OneDrive/Transfer/Coursera/Tasks/Exploratoy Data Analysis/Week 1/ExData_Plotting1")

library(RSQLite)
library(sqldf)
library(lubridate)

#Use SQL commands to read in just the lines with the specified dates
df<- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" OR Date == "2/2/2007"', sep = ";")
closeAllConnections()

#Set all ? to NA
df[df == "?"] <- NA

#Create new Variable containing Date and Time
df$datetime<- with(df, dmy(Date) + hms(Time))

#Plot 4
#Set System to English because otherwise weekdays in legend would appear in German
Sys.setlocale("LC_TIME", "en_US")

#Prepare multiple plots in one view
par(mfcol = c(2,2))
par(cex.lab=0.75,cex.axis=0.75)

#Create Plot topleft
#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Global_active_power, type = "n", xlab = "", cex.lab = 0.75, cex.axis = 0.75,
     ylab="Global Active Power")
#Insert line in plot
lines(df$datetime,df$Global_active_power, type = "l")

#Create Plot bottomleft
#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Sub_metering_1, type = "n", xlab = "", 
     ylab="Energy sub metering")
#Insert lines in plot
lines(df$datetime,df$Sub_metering_1, type = "l")
lines(df$datetime,df$Sub_metering_2, type = "l", col = "red")
lines(df$datetime,df$Sub_metering_3, type = "l", col = "blue")
#Insert legend
legend("topright", lty = "solid", col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75, bty = "n")

#Create Plot topright
plot(df$datetime,df$Voltage, type = "n", xlab = "datetime", cex.lab = 0.75, cex.axis = 0.75,
     ylab="Voltage")
#Insert line in plot
lines(df$datetime,df$Voltage, type = "l")

#Create Plot bottomright
#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Global_reactive_power, type = "n", xlab = "datetime", cex.lab = 0.75, cex.axis = 0.75,
     ylab="Global_reactive_power")
#Insert line in plot
lines(df$datetime,df$Global_reactive_power, type = "l")








#Repeat code but save to .png
png("plot4.png", width)
#Set System to English because otherwise weekdays in legend would appear in German
Sys.setlocale("LC_TIME", "en_US")

#Prepare multiple plots in one view
par(mfcol = c(2,2))
par(cex.lab=0.75,cex.axis=0.75)

#Create Plot topleft
#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Global_active_power, type = "n", xlab = "", cex.lab = 0.75, cex.axis = 0.75,
     ylab="Global Active Power")
#Insert line in plot
lines(df$datetime,df$Global_active_power, type = "l")

#Create Plot bottomleft
#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Sub_metering_1, type = "n", xlab = "", 
     ylab="Energy sub metering")
#Insert lines in plot
lines(df$datetime,df$Sub_metering_1, type = "l")
lines(df$datetime,df$Sub_metering_2, type = "l", col = "red")
lines(df$datetime,df$Sub_metering_3, type = "l", col = "blue")
#Insert legend
legend("topright", lty = "solid", col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75, bty = "n")

#Create Plot topright
plot(df$datetime,df$Voltage, type = "n", xlab = "datetime", cex.lab = 0.75, cex.axis = 0.75,
     ylab="Voltage")
#Insert line in plot
lines(df$datetime,df$Voltage, type = "l")

#Create Plot bottomright
#Prepare plot w/o data, no X-Label, and Y-Label name
plot(df$datetime,df$Global_reactive_power, type = "n", xlab = "datetime", cex.lab = 0.75, cex.axis = 0.75,
     ylab="Global_reactive_power")
#Insert line in plot
lines(df$datetime,df$Global_reactive_power, type = "l")
dev.off()
