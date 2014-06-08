setwd("C:/Coursera/4. Exploratory Data Analysis")

dt <- fread("./Pwr/power_consumption.txt",header=TRUE, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subDt <- dt[strptime(as.character(dt$Date),"%e/%m/%Y") %in% c ("2007-02-02","2007-02-01"),]
subDt$datetime <- as.POSIXct(paste(subDt$Date, subDt$Time), format="%e/%m/%Y %H:%M:%S")
dt <- NULL

hist(as.numeric(subDt$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off(4)