#####################################################

# GETTING THE DATA

# Reading the file household_power_consumption.txt from the current working directory

total_data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";",
                         na.strings = "?")

# Subsetting the data for the dates 2017-02-01 and 2007-02-02

data <- subset(total_data, Date == "1/2/2007" | Date == "2/2/2007")

# Removing the total data charged first in order to free the memory

rm(total_data)

# Transforming the Date column into date format

data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Creating a new column called DateTime

data$DateTime <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

#####################################################

# BUILDING THE LINE CHART

# Calling the plot command

plot(data$DateTime, # X-axis data
     data$Global_active_power, # Y-axis data
     xlab = "", # Empty x-axis label 
     ylab = "Global Active Power (kilowatts)", # Y-axis label
     type = "n") # this indicates not to plot the data

# Adding lines to the plot

lines(data$DateTime, data$Global_active_power)

# Copying the plot to a png file

dev.copy(png, file = "plot2.png", width = 480)

# Closing the png graphics device

dev.off()

# Removing the data to free the memory

rm(data)


