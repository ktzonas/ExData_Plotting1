
# Read the dataset for household power consumption (dates 1/2/2007 - 2/2/2007) into data frame 'hpc'
source('hpc_setup.R')

# Open PNG device (480x480px)
png(file='plot3.png', width = 480, height = 480, units = 'px')

# Start with a blank plot, then add each part in a different color
plot(hpc$DateTime, hpc$Sub_metering_1, xlab='', ylab='Energy sub metering', type='n')
points(hpc$DateTime, hpc$Sub_metering_1, type='l', col='black')
points(hpc$DateTime, hpc$Sub_metering_2, type='l', col='red')
points(hpc$DateTime, hpc$Sub_metering_3, type='l', col='blue')
legend('topright', pch=1, col=c('black', 'red', 'blue'), legend=c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'))

# Close PNG device
dev.off()
