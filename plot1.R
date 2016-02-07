
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
ls
png('plot1.png',bg = "white")
hist(df$Global_active_power,main = "Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()