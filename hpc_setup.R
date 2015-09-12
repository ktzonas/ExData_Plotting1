
## Read the dataset

# We only need to get the observations of 1/2/2007 and 2/2/2007.
# Because the lines are sorted by date and time, we can see that
# these observations start at line 66637 and end at line 69517:
# 
# [66637] 1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000 # The first observation of 1/7/2007
# [69517] 2/2/2007;23:59:00;3.680;0.224;240.370;15.200;0.000;2.000;18.000 # The last observation of 2/7/2007
#
# (note that in the file, l.1 is the header, so l.66637 of the dataset is l.66638 of the file)
# 
# So we only need to read the lines from l.66637 to l.69517
# To do that, skip the first 66636 lines and read (69517 - 66636) = 2880 rows
hpc <- read.csv('household_power_consumption.txt', sep=';', skip=66636, nrows=2880)

# Set the column names for data from `hpc` from the header of the file (not sure why they are not kept when reading part of the file)
hpc.header <- read.csv('household_power_consumption.txt', sep=';', nrows=1, head=FALSE)
names(hpc) <- as.character(unlist(hpc.header))

# Add a 'timestamp' column (POSIXlt) from 'Date' and 'Time'
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time),'%d/%m/%Y %H:%M:%S')


## Here we need to set the locale explicitly so that days appear with english names in the plots.

# Find the current OS type, so that a proper locale descriptor is passed in `setlocale`
os <- tolower(Sys.info()['sysname'])
localestring <- if (os == 'windows') 'English' else if (os == 'linux') 'en_US.utf8' else 'en_US'
Sys.setlocale("LC_TIME", localestring)
