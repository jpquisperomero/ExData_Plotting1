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

# Creating a column for the maximum of the three sub meterings for each row

data$MaxSubMetering <- with(data, pmax(Sub_metering_1, Sub_metering_2, Sub_metering_3))

#####################################################

# BUILDING THE CHARTS

# Indicating that four plots will be displayed in two lines and two columns

par(mfrow = c(2, 2))


# FIRST CHART

# Calling the plot command

plot(data$DateTime, # X-axis data
     data$Global_active_power, # Y-axis data
     xlab = "", # Empty x-axis label 
     ylab = "Global Active Power", # Y-axis label
     type = "n") # this indicates not to plot the data

# Adding lines to the plot

lines(data$DateTime, data$Global_active_power)

# SECOND CHART

# Calling the plot command

plot(data$DateTime, # X-axis data
     data$Voltage, # Y-axis data
     xlab = "datetime", # X-axis label 
     ylab = "Voltage", # Y-axis label
     type = "n") # this indicates not to plot the data

# Adding lines to the plot

lines(data$DateTime, data$Voltage)

# THIRD CHART

# Calling the plot command

plot(data$DateTime, # X-axis data
     data$MaxSubMetering, # Y-axis data
     xlab = "", # Empty x-axis label 
     ylab = "Energy sub metering", # Y-axis label
     type = "n") # this indicates not to plot the data

# Adding lines to the plot

lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# Adding the legend

legend("topright", # Position of the legend
       lty = "solid", # Line type
       col = c("black", "red", "blue"), # Colors of the lines
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), # Legend texts
       bty = "n", # Legend box without line
       inset = c(-0.07, -0.15), # Inset distance from the margins
       y.intersp = 0.25) # Vertical spacing

# FOURTH CHART

# Calling the plot command

plot(data$DateTime, # X-axis data
     data$Global_reactive_power, # Y-axis data
     xlab = "datetime", # X-axis label 
     ylab = "Global_reactive_power", # Y-axis label
     type = "n") # this indicates not to plot the data

# Adding lines to the plot

lines(data$DateTime, data$Global_reactive_power)


# Copying the plot to a png file

dev.copy(png, file = "plot4.png", width = 480)

# Closing the png graphics device

dev.off()

# Removing the data to free the memory

rm(data)