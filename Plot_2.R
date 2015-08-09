# Exploratory Data Analysis - Course Project 1 - Code for Pl 2

setwd('C:/Users/riteshp597/Documents')
dt=read.csv('household_power_consumption.txt',header=T, sep=';') # Text file readf
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  # Data and time merged
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') # Date's data type changed 
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') #sRequired days selected
dt[,3] = as.numeric(as.character(dt[,3]))
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') 

#Plot No. 2
png('plot2.png',width=480,height=480)
plot(dt$dt,dt$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()
