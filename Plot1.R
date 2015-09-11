Plot1<-function(){
      dt<-read.csv("dataSubset.csv")
      
      png(file = "Plot1.png", width = 480, height = 480)
      
      hist(dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
      
      ## close the PNG device
      dev.off() 
}
      