readData<-function(){
      dt<-read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE )
      dt<-subset(dt,dt$Date=="1/2/2007" | dt$Date=="2/2/2007")
      dt$ntime<-strptime(paste(dt$Date, dt$Time), format("%d/%m/%Y %H:%M:%S"))
      dt<-dt[,c(10,3:9)]
      write.csv(dt,file="dataSubset.csv", row.names=FALSE)
      row.names(dt)<-NULL
      dt
}