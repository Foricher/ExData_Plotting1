Sys.setlocale("LC_TIME", "English")

source("common.R")

data <- get_hpc_data ()

with(data, {
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)",col ="black")
    lines(DateTime,Sub_metering_2,col='Red')
    lines(DateTime,Sub_metering_3,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5 
             )
})

## Save file
dev.copy(png, file="plot3.png", height=480, width=480, units="px")
dev.off()

