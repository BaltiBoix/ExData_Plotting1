Plot3<-function(){
      ##
      ##    Reads the subset file created using readData.R and creates Plot3.png 
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
      png(file = "Plot3.png", width = 480, height = 480) 
      
      ##  plot the axes of the graphic without data 
      ##
      plot(dt$ntime, dt$Sub_metering_1, type="n",ylab="Energy sub metering (watt-hour)", xlab="")
      
      ##  add the lines with different colours
      ##
      lines(dt$ntime, dt$Sub_metering_1, col="black")
      lines(dt$ntime, dt$Sub_metering_2, col="red")
      lines(dt$ntime, dt$Sub_metering_3, col="blue")
      
      ##  print the legend using the cols names
      ##
      legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(dt[6:8]))
      
      ##  change the locale to default
      ##
      Sys.setlocale("LC_TIME", actLC)
      
      ## close the PNG device
      dev.off() 
      
}