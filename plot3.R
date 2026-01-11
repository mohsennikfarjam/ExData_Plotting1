# Download and unzip the dataset
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("household_power_consumption.txt")) {
    download.file(dataset_url, "dataset.zip")
    unzip("dataset.zip")
}

# Read and subset data
full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))

# Process plot 3
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, sub1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()