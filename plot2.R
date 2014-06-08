setwd("C:/Coursera/4. Exploratory Data Analysis")

dt <- fread("./Pwr/power_consumption.txt",header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subDt <- dt[strptime(as.character(dt$Date),"%e/%m/%Y") %in% c ("2007-02-02","2007-02-01"),]
subDt$datetime <- as.POSIXct(paste(subDt$Date, subDt$Time), format="%e/%m/%Y %H:%M:%S")

x <- subDt$datetime
y <- subDt$Global_active_power
plot2Dtok <- complete.cases(x,y)

plot(x[plot2Dtok],y[plot2Dtok],type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png")
dev.off(4)