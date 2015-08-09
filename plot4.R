constructMultiPlots <- function()
{
  
  library(dplyr)
  workingDir <- setwd("c:/MyWork/Coursera/DS/R_Programming")
  #read data for 49 days.( read rows upto 2nd Feb 2007)
  epcDF <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                      header=TRUE,sep=";",nrows=70560,colClasses="character")
  mDates <- c("1/2/2007","2/2/2007")
  
  # extract rows corresponding to 1st and 2nd Feb only.
  epcDF1 <- filter(epcDF, as.character(epcDF$Date)==as.character(mDates[1])
                   | as.character(epcDF$Date)==as.character(mDates[2]))
  
  combineDT <- paste(epcDF1$Date,epcDF1$Time)
  myDate <- strptime(combineDT,"%d/%m/%Y %H:%M:%S")
    
  par(mfrow=c(2,2))
  par(mar=c(4,4,2,2))
  # Plot first graph
  plot(x=myDate,y=as.numeric(epcDF1$Global_active_power), type="l",xlab="",ylab="Global Active Power (Killowatts)", col="black")
  
  # Plot Second graph
  plot(x=myDate,y=as.numeric(epcDF1$Voltage), type="l",xlab="datetime",ylab="Voltage", col="black")
  
  # Plot Third graph
  plot(x=myDate,y=epcDF1$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering", col="black")
  par(new=TRUE) 
  points(x=myDate,y=epcDF1$Sub_metering_2, type="l",xlab="",ylab="", col="orange")
  par(new=TRUE) 
  
  points(x=myDate,y=epcDF1$Sub_metering_3, type="l",xlab="",ylab="", col="blue")
  # Set legend for the plot
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","orange","blue"),lty=1, text.font=2.9,cex=0.34)
  
  # Plot Fourth graph
  plot(x=myDate,y=as.numeric(epcDF1$Global_reactive_power), type="l",xlab="datetime",ylab="Global_reactive_power", col="black")
  dev.copy(png, file="./plot4.png",width=480,height=480,units="px")
  dev.off()
  
}