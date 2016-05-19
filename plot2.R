# Exploratory Data Analysis
# Assignment: Course Project 1: Plot 2
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
png("plot2.png", width=480, height=480)

# creating the Plot
plot(strptime(paste(mySubSet$Date, mySubSet$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(mySubSet$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# Closing the device
dev.off()
