


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



### Plot 2

plot(data_final$DateTime, as.numeric(as.character(data_final$Global_active_power)),
     
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")


dev.copy(png, "plot2.png", width=480, height=480)

dev.off
