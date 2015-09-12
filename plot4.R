
# Read the dataset for household power consumption (dates 1/2/2007 - 2/2/2007) into data frame 'hpc'
source('hpc_setup.R')

# Open PNG device (480x480px)
png(file='plot4.png', width = 480, height = 480, units = 'px')

# set screen parameters to lay out 2x2 = plots, filling rows first
par(mfrow=c(2, 2))

# 4.1
plot(hpc$DateTime, hpc$Global_active_power, xlab='', ylab='Global Active Power', type='l')

# 4.2
plot(hpc$DateTime, hpc$Voltage, xlab='datetime', ylab='Voltage', type='l')

# 4.3
plot(hpc$DateTime, hpc$Sub_metering_1, xlab='', ylab='Energy sub metering', type='n')
points(hpc$DateTime, hpc$Sub_metering_1, type='l', col='black')
points(hpc$DateTime, hpc$Sub_metering_2, type='l', col='red')
points(hpc$DateTime, hpc$Sub_metering_3, type='l', col='blue')
legend('topright', pch=1, col=c('black', 'red', 'blue'), legend=c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'))

# 4.4
plot(hpc$DateTime, hpc$Global_reactive_power, xlab='datetime', type='l')

# Close PNG device
dev.off()
