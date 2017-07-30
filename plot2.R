data<-read.table("household_power_consumption.txt",header=T,sep=";")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subSetData$Global_active_power)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="Plot2.png",height=480,width=480)
dev.off()