#####################################################

# GETTING THE DATA

# Reading the file household_power_consumption.txt from the current working directory

total_data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";",
                         na.strings = "?")

# Subsetting the data for the dates 2017-02-01 and 2007-02-02

data <- subset(total_data, Date == "1/2/2007" | Date == "2/2/2007")

# Removing the total data charged first in order to free the memory

rm(total_data)

#####################################################

# BUILDING THE HISTOGRAM

# Calling the hist command

hist(data$Global_active_power,
     col = "red", # color of the bars
     main = "Global Active Power", # main title
     xlab = "Global Active Power (kilowatts)", # label of the x-axis
     ylab = "Frequency") # label of the y-axis

# Copying the plot to a png file

dev.copy(png, file = "plot1.png", width = 480)

# Closing the png graphics device

dev.off()

# Removing the data to free the memory

rm(data)


