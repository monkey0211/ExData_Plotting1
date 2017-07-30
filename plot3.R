data<-read.table("household_power_consumption.txt",header=T,sep=";")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subdata$Global_active_power)
with(subdata,plot(datetime, Sub_metering_1,col="black",type="n",xlab="",ylab="Energy sub metering"))
with(subdata, lines(datetime, Sub_metering_2,col="red"))
with(subdata, lines(datetime, Sub_metering_1,col="black"))
with(subdata, lines(datetime, Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
title(main="Energy sub-metering")

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
