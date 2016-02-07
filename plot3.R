
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

png('plot3.png', bg = "white")
plot(x=df$datetime,y=df$Sub_metering_1,type='l',xlab = '', ylab = "Energy sub metering")
lines(x=df$datetime,y=df$Sub_metering_2,type='l',col = 'red')
lines(x=df$datetime,y=df$Sub_metering_3,type='l',col = 'blue')
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","blue","red"))
dev.off()

