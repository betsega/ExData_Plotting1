

setwd("C://01 Mylocal driver/Coursera_Data_Science_Specialization/_Course4_Exploratory_DataAnalysis/Assignment1")



### Read data file

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")


## creat a variable of DateTime from Date and Time columns

data$DateTime<-paste(data$Date, data$Time)

## formate DateTime column using striptime

data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

### Extract data for the dates 2007-02-01 and 2007-02-02

dat1<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

dat2<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data_final<-data[dat1:dat2,]



### Plot 3

plot(data_final$DateTime, as.numeric(as.character(data_final$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")

lines(data_final$DateTime, as.numeric(as.character(data_final$Sub_metering_2)),type='l', col='red')

lines(data_final$DateTime, data_final$Sub_metering_3,type='l', col="blue")

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1)
       
       ,col=c("black","red","blue"))


## saving the figure

dev.copy(png, "plot3.png", width=480, height=480)

dev.off
