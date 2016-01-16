setwd('/home/kushwanth/machinelearning/r_practice/DataScience_Specialization/R programming/assignment1')
electric_data = read.table("household_power_consumption.txt",sep=";",header=TRUE)  
electric_data$Date_Time<-strptime(paste(electric_data$Date,electric_data$Time),"%d/%m/%Y %H:%M:%S")
electric_data[c(100,20000,50000),c(1,2,10)]
electric_data$Date <- as.Date(electric_data$Date, "%d/%m/%Y")
electric_data<-electric_data[electric_data$Date==as.Date("2007-02-01")|electric_data$Date==as.Date("2007-02-02"),]
#png("./plot3.png", width = 480, height = 480)
electric_data$Global_active_power<-as.numeric(electric_data$Global_active_power)
electric_data$Sub_metering_1<-as.numeric(electric_data$Sub_metering_1)
electric_data$Sub_metering_2<-as.numeric(electric_data$Sub_metering_2)
electric_data$Sub_metering_3<-as.numeric(electric_data$Sub_metering_3)
electric_data$Global_active_power<-as.numeric(electric_data$Global_active_power)
png("./plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1-----------------

plot(electric_data$Date_Time,electric_data$Global_active_power,type='l',xlab='',ylab='Global Active Power',main='')

#plot 2-----------------

plot(electric_data$Date_Time,electric_data$Voltage,type='l',ylab='Voltage',xlab='datetime',main='')



#plot 3-----------------
#png("./plot3.png", width = 480, height = 480)
plot(electric_data$Date_Time,electric_data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering',main='')
lines(electric_data$Date_Time,electric_data$Sub_metering_2,type='l',col='red')
lines(electric_data$Date_Time,electric_data$Sub_metering_3,type='l',col='blue')
expre<-expression('Sub_metering_1','Sub_metering_2','Sub_metering_3')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=.75,lty = c(1,1,1), col = c(1,2,4), adj = c(0,0.00001,0.00002))



#plot 4------------------
plot(electric_data$Date_Time,electric_data$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime',main='')



dev.off()
