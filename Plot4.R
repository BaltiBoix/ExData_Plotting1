Plot4<-function(){
      dt<-read.csv("dataSubset.csv")
      dt$ntime<-strptime(dt$ntime, format("%Y-%m-%d %H:%M:%S"))
      
      actLC<-Sys.getlocale("LC_TIME")
      Sys.setlocale("LC_TIME", "English")
      
      png(file = "Plot4.png", width = 480, height = 480)
      
      par(mfrow = c(2, 2))
      
      plot(dt$ntime, dt$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="")
      lines(dt$ntime, dt$Global_active_power)
      
      plot(dt$ntime, dt$Voltage, type="n",ylab="Voltage (volt)", xlab="datetime")
      lines(dt$ntime, dt$Voltage)
      
      plot(dt$ntime, dt$Sub_metering_1, type="n",ylab="Energy sub metering (watt-hour)", xlab="")
      
      lines(dt$ntime, dt$Sub_metering_1, col="black")
      lines(dt$ntime, dt$Sub_metering_2, col="red")
      lines(dt$ntime, dt$Sub_metering_3, col="blue")
      
      legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(dt[6:8]), bty = "n")
      
      plot(dt$ntime, dt$Global_reactive_power, type="n",ylab="Global reactive power (kilowatt)", xlab="datetime")
      lines(dt$ntime, dt$Global_reactive_power)

            Sys.setlocale("LC_TIME", actLC)
      
      ## close the PNG device
      dev.off() 
      
}