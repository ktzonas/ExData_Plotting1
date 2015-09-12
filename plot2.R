
# Read the dataset for household power consumption (dates 1/2/2007 - 2/2/2007) into data frame 'hpc'
source('hpc_setup.R')

# Open PNG device (480x480px)
png(file='plot2.png', width = 480, height = 480, units = 'px')

plot(hpc$DateTime, hpc$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

# Close PNG device
dev.off()
