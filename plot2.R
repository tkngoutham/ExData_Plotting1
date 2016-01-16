setwd('/home/kushwanth/machinelearning/r_practice/DataScience_Specialization/R programming')
electric_data = read.table("household_power_consumption.txt",sep=";",header=TRUE)  
#electric_data$Date<-as.character(electric_data$Date)
#electric_data$Time<-as.character(electric_data$Time)
electric_data$Date_Time<-strptime(paste(electric_data$Date,electric_data$Time),"%d/%m/%Y %H:%M:%S")
electric_data[c(100,20000,50000),c(1,2,10)]
electric_data$Date <- as.Date(electric_data$Date, "%d/%m/%Y")
#class(electric_data$Time)
#electric_data$Time<-strptime(electric_data$Time,"%H:%M:%S")
electric_data<-electric_data[electric_data$Date==as.Date("2007-02-01")|electric_data$Date==as.Date("2007-02-02"),]
class(electric_data$Global_active_power)


electric_data$Global_active_power<-as.numeric(electric_data$Global_active_power)
plot(electric_data$Date_Time,electric_data$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)',main='Global Active Power')
