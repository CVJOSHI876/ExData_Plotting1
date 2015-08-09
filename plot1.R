epcData <- function()
{
  library(dplyr)
  workingDir <- setwd("c:/MyWork/Coursera/DS/R_Programming")
  # read rows upto 2nd Feb 2007
  epcDF <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                      header=TRUE,sep=";",nrows=70560,colClasses="character")
  
  mDates <- c("1/2/2007","2/2/2007")
  
  # read rows corresponding to these 2 dates only.
  epcDF1 <- filter(epcDF, as.character(epcDF$Date)==as.character(mDates[1])
  | as.character(epcDF$Date)==as.character(mDates[2]))
  # plot the graph.
  hist(as.numeric(epcDF1$Global_active_power),freq= TRUE,main="Global Active Power",xlab="Global Active Power(Kilowatts)",col="orange")
  # Save plot to the file
  dev.copy(png, file="./plot1.png")
  dev.off()
                   
}