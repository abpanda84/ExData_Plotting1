setwd("C:/Coursera/4. Exploratory Data Analysis")

dt <- fread("./Pwr/power_consumption.txt",header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subDt <- dt[strptime(as.character(dt$Date),"%e/%m/%Y") %in% c ("2007-02-02","2007-02-01"),]
subDt$datetime <- as.POSIXct(paste(subDt$Date, subDt$Time), format="%e/%m/%Y %H:%M:%S")

#Initialize the Plot layout
par(mfrow=c(2,2), mar = c(5,4,4,2))

#1 Generate Plot of Power - Plot 3
x <- subDt$datetime
y <- subDt$Global_active_power
plot2Dtok <- complete.cases(x,y)
plot(x[plot2Dtok],y[plot2Dtok],type="l",ylab="Global Active Power",xlab="")

#2 Generate Plot of Voltage - New Plot 1
x <- subDt$datetime
y <- subDt$Voltage
plot2Dtok <- complete.cases(x,y)
plot(x[plot2Dtok],y[plot2Dtok],type="l",ylab="Voltage",xlab="datetime")

#3 Generate Plot of Energy - Plot 3
x <- subDt$datetime
d <- subDt$Sub_metering_1
e <- subDt$Sub_metering_2
f <- subDt$Sub_metering_3
with(dt, plot(x,d,type="l", ylab="Energy sub metering", xlab=""))
with(dt, points(x,e,type="l", col="red"))
with(dt, points(x,f,type="l", col="blue"))
legend("topright",lty =c("solid","solid","solid"), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, bty="n", xjust=0)

#4 Generate Plot of Reactive Power - New Plot 1
x <- subDt$datetime
y <- subDt$Global_reactive_power
plot2Dtok <- complete.cases(x,y)
plot(x[plot2Dtok],y[plot2Dtok],type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off(4)