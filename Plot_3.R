setwd('C://Users//Tijl//Documents//Github//edaCoursera')
dt=read.csv('household_power_consumption.txt',header=T, sep=';') 
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') 
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 
dt[,3] = as.numeric(as.character(dt[,3])) 
dt$Sub_metering_1 <- (as.numeric(as.character(dt$Sub_metering_1))) 
dt$Sub_metering_2 <- (as.numeric(as.character(dt$Sub_metering_2)))
dt$Sub_metering_3 <- (as.numeric(as.character(dt$Sub_metering_3)))
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') # create a datetime object 

#Plot No. 3
png('plot3.png',width=480,height=480)
plot(dt$dt,dt$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(dt$dt,dt$Sub_metering_2,col='red')
lines(dt$dt,dt$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,lwd=1.5)
dev.off()
