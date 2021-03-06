Plot2<-function(){
      ##
      ##    Reads the subset file created using readData.R and creates Plot2.png 
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
      
      png(file = "Plot2.png", width = 480, height = 480)
      
      plot(dt$ntime, dt$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="")
      lines(dt$ntime, dt$Global_active_power)
      
      ##  change the locale to default
      ##
      Sys.setlocale("LC_TIME", actLC)

      ## close the PNG device
      dev.off() 

}
