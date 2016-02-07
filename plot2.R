
dataURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
datazip <- basename(URLdecode(dataURL))
datafile <- sub("[.][^.]*$", "", datazip)

if(!file.exists(datazip)){
  if(!file.exists(datazip)){
    download.file(dataURL, destfile = datazip)
  }
  unzip(datafile)
}

df <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = '?')
df <- df[grep('^[12]/2/2007',df$Date),]
df$datetime <- (as.POSIXct(paste(df$Date,df$Time),format='%d/%m/%Y %H:%M:%S'))

png('plot2.png', bg = "white")
plot(x=df$datetime,y=df$Global_active_power,type='l',xlab = '', ylab = "Global Active Power (kilowatts)")
dev.off()

