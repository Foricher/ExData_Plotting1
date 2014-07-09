
source("common.R")

data <- get_hpc_data ()

# plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Save file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

