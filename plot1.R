
# Read the dataset for household power consumption (dates 1/2/2007 - 2/2/2007) into data frame 'hpc'
source('hpc_setup.R')

# Open PNG device (480x480px)
png(file='plot1.png', width = 480, height = 480, units = 'px')

hist(hpc$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

# Close PNG device
dev.off()
