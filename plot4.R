# Exploratory Data Analysis
# Assignment: Course Project 1: Plot 4
# ====================================

# Download file in a new directory dedicated to the Assignment
# If the directory do not exists a new directory will be created
if(!file.exists("./ElectricPowerConsuption")){dir.create("./ElectricPowerConsuption")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./ElectricPowerConsuption/power_consumption.zip")

# The file is a zip file. This step unzip the file in the working directory
unzip("./ElectricPowerConsuption/power_consumption.zip", exdir = "./ElectricPowerConsuption")

# Loading files in a dataset
myDataSet <- read.table("./ElectricPowerConsuption/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Subset data from 01/02/2007 to 02/02/2007
# ==============================================
mySubSet <- myDataSet[myDataSet$Date %in% c("1/2/2007","2/2/2007"),]

# preparing the .png output of the Plot
png("plot4.png", width=480, height=480)

# defining output rows,columns and margins 
par(mfrow=c(2,2), mar = c(5,4,1,1))

# creating the Plot 1
plot(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Global_active_power), xlab = "", ylab = "Global Active Power", type = "l")

# creating the Plot 2
plot(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Voltage), xlab = "datetime", ylab = "Voltage", type = "l")

# creating the Plot 3
plot(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "l")
lines(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Sub_metering_2), type = "l", col = "red")
lines(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lty = 1, col = c("black", "red", "blue"), bty = "n")

# creating the Plot 4
plot(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# Closing the device
dev.off()
