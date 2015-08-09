# Course Project 1

setwd('C:/Users/riteshp597/Documents')
dt=read.csv('household_power_consumption.txt',header=T, sep=';') # Read the csv text file
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  # Date and time merged to a single column
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') # Date's datatype changed to date 
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') # The required days are selected
dt[,3] = as.numeric(as.character(dt[,3])) # Convert datatype to number

#Plot the graph
png('plot1.png',width=480,height=480)
hist(dt[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()
