data<-read.table("household_power_consumption.txt",header=T,sep=";")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subdata$Global_active_power)

par(mfrow=c(2,2))
with(subdata,{
plot(datetime,Global_active_power,type="l",ylab="Global_active_power")

plot(datetime,Voltage,type="l",xlab = "datetime",ylab = "Voltage")

plot(datetime, Sub_metering_1,col="black",type="n",xlab="",ylab="Energy sub metering")
lines(datetime, Sub_metering_2,col="red")
lines(datetime, Sub_metering_1,col="black")
lines(datetime, Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

plot(datetime,Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")}
)
dev.copy(png,file="Plot4.png",height=480,width=480)
dev.off()