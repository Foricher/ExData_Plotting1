Sys.setlocale("LC_TIME", "English")

source("common.R")

data <- get_hpc_data ()

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
    plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

    plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)",col ="black")
    lines(DateTime,Sub_metering_2,col='Red')
    lines(DateTime,Sub_metering_3,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,  bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
})


#dev.copy(png, file="plot4.png", height=480, width=480, units="px")
dev.off()

