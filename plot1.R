setwd("D:/Rcode")

PowerConsum=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

PowerConsum$DateTime <- paste(PowerConsum$Date, PowerConsum$Time, sep=" ")

PowerConsum$Date <- as.Date(PowerConsum$Date, format="%d/%m/%Y")

PowerConsum$DateTime <- strptime(PowerConsum$DateTime, format="%d/%m/%Y %H:%M:%S")

filtered <- subset(PowerConsum, Date == "2007-02-01" | Date == "2007-02-02")

filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))

hist(filtered$Global_active_power, main="Global Active Power", 
       +      xlab="Global Active Power(kilowatts)", col="red", ylim=c(0,1200))