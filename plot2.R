
Sys.setlocale("LC_TIME", "English")

source("common.R")

data <- get_hpc_data ()

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
