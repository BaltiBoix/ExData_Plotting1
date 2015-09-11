Plot2<-function(){
      dt<-read.csv("dataSubset.csv")
      dt$ntime<-strptime(dt$ntime, format("%Y-%m-%d %H:%M:%S"))
      
      actLC<-Sys.getlocale("LC_TIME")
      Sys.setlocale("LC_TIME", "English")
      
      png(file = "Plot2.png", width = 480, height = 480)
      
      plot(dt$ntime, dt$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="")
      lines(dt$ntime, dt$Global_active_power)
      
      Sys.setlocale("LC_TIME", actLC)

      ## close the PNG device
      dev.off() 

}
