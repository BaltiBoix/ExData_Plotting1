readData<-function(){
      ##
      ##    Reads the huge file with all the data and creates an small subset with only the relevant data of the 
      ##  days 01/02/2007 and 02/02/2007.
      ##
      
      ##  read the file
      ##
      dt<-read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE )

      ##  subset the two days of the assignment
      ##
      dt<-subset(dt,dt$Date=="1/2/2007" | dt$Date=="2/2/2007")

      ##  convert the cols Date and Time to POSIXlt class in a new col called ntime
      ##
      dt$ntime<-strptime(paste(dt$Date, dt$Time), format("%d/%m/%Y %H:%M:%S"))

      ##  remove the cols Date and Time and put first col ntime
      ##
      dt<-dt[,c(10,3:9)]

      ##  write to a csv file the subset. It will be read by the plotting routines 
      ##
      write.csv(dt,file="dataSubset.csv", row.names=FALSE)
      
      ##  return the subset to be used interactively (dt_df<-readData())
      ##
      row.names(dt)<-NULL
      dt
}