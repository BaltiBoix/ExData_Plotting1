Plot4<-function(){
      ##
      ##    Reads the subset file created using readData.R and creates Plot4.png 
      ##
      
      ##  read the file
      ##
      dt<-read.csv("dataSubset.csv")
      
      ##  convert the col ntime to POSIXlt class
      ##
      dt$ntime<-strptime(dt$ntime, format("%Y-%m-%d %H:%M:%S"))
      
      ##  change the locale to print the week days in english
      ##
      actLC<-Sys.getlocale("LC_TIME")
      Sys.setlocale("LC_TIME", "English")
      
      ##  open the png graphic device
      ##
      png(file = "Plot4.png", width = 480, height = 480)
      
      ##  4 graphics 2 rows x 2 cols 
      ##
      par(mfrow = c(2, 2))
      
      ##  Plot first graphic 
      ##
      plot(dt$ntime, dt$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="")
      lines(dt$ntime, dt$Global_active_power)
      
      ##  Plot second graphic 
      ##
      plot(dt$ntime, dt$Voltage, type="n",ylab="Voltage (volt)", xlab="datetime")
      lines(dt$ntime, dt$Voltage)
      
      ##  Plot third graphic 
      ##
      plot(dt$ntime, dt$Sub_metering_1, type="n",ylab="Energy sub metering (watt-hour)", xlab="")
      
      lines(dt$ntime, dt$Sub_metering_1, col="black")
      lines(dt$ntime, dt$Sub_metering_2, col="red")
      lines(dt$ntime, dt$Sub_metering_3, col="blue")
      
      legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(dt[6:8]), bty = "n")
      
      ##  Plot fourth graphic 
      ##
      plot(dt$ntime, dt$Global_reactive_power, type="n",ylab="Global reactive power (kilowatt)", xlab="datetime")
      lines(dt$ntime, dt$Global_reactive_power)

      ##  change the locale to default
      ##
      Sys.setlocale("LC_TIME", actLC)
      
      ## close the PNG device
      dev.off() 
      
}