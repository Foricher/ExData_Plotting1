

download_hpc <- function(furl, fname) {
    if(!file.exists(fname)) {
        download.file(url=furl, destfile=fname, method="curl")
        unzip(fname)
    }
}

get_hpc_data <- function() {
    filename <- "household_power_consumption.txt"
    if(!file.exists(filename)) {
        message("download Data.")
        download_hpc("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
    }
    message("Read Data.")
    hpc <- read.csv(filename, sep=';', na.strings='?',stringsAsFactors=FALSE)
    message("Convert.")
    # convert to date
    hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
    message("Select")
    # select
    hpc_partial <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]    
    message("Create Date time")
    # create a new datetime column
    hpc_partial$DateTime <- strptime(paste(hpc_partial$Date, hpc_partial$Time), format="%Y-%m-%d %H:%M:%S")
    hpc_partial
}
