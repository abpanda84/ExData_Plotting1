setwd("C:/Coursera/4. Exploratory Data Analysis")

dt <- fread("./Pwr/power_consumption.txt",header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subDt <- dt[strptime(as.character(dt$Date),"%e/%m/%Y") %in% c ("2007-02-02","2007-02-01"),]
subDt$datetime <- as.POSIXct(paste(subDt$Date, subDt$Time), format="%e/%m/%Y %H:%M:%S")

x <- subDt$datetime
d <- subDt$Sub_metering_1
e <- subDt$Sub_metering_2
f <- subDt$Sub_metering_3

with(dt, plot(x,d,type="l", ylab="Energy sub metering", xlab=""))
with(dt, points(x,e,type="l", col="red"))
with(dt, points(x,f,type="l", col="blue"))
legend("topright",lty =c("solid","solid","solid"), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.9)

dev.copy(png, file="plot3.png")
dev.off(4)