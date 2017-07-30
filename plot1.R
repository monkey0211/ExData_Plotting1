
data<-read.table("household_power_consumption.txt",header=T,sep=";")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data$Time<-strptime(data$Time, format = "%H:%M:%S")
subdata<-subset(data,Date == "2007-02-02"|Date == "2007-02-01")
hist(as.numeric(subdata$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()