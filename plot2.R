constructPlot <- function()
{
  
  library(dplyr)
  workingDir <- setwd("c:/MyWork/Coursera/DS/R_Programming")
  # read rows upto 2nd Feb 2007
  epcDF <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                      header=TRUE,sep=";",nrows=70560,colClasses="character")
  mDates <- c("1/2/2007","2/2/2007")
  # extract rows corresponding to 1st and 2nd Feb only.
  epcDF1 <- filter(epcDF, as.character(epcDF$Date)==as.character(mDates[1])
                   | as.character(epcDF$Date)==as.character(mDates[2]))
   
  combineDT <- paste(epcDF1$Date,epcDF1$Time)
  myDate<- strptime(combineDT,"%d/%m/%Y %H:%M:%S")
  newDF <- data.frame(myDate,as.numeric(epcDF1$Global_active_power) )
  plot(x=myDate,y=as.numeric(epcDF1$Global_active_power), type="l",xlab="",ylab="Global Active Power (Killowatts)", col="black")
  dev.copy(png, file="./plot2.png")
  dev.off()
  rm(epcDF)
  rm(combineDT)
  
}