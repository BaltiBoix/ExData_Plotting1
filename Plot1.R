Plot1<-function(){
      ##
      ##    Reads the subset file created using readData.R and creates Plot1.png 
      ##
      
      ##  read the file
      ##
      dt<-read.csv("dataSubset.csv")
      
      ##  open the png graphic device
      ##
      png(file = "Plot1.png", width = 480, height = 480)
      
      ##  Plot the histogram
      ##
      hist(dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
      
      ## close the PNG device
      dev.off() 
}
      