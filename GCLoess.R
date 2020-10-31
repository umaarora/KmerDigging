
####################################
#####Load required libraries########
####################################
library(dplyr)
library(ggplot2)

####################################
#####set file and  path########
####################################

f <- "file.subset.GCcontent.txt"

setwd("/projects/dumont-lab/uma/k31/GCcontent")
path = "/projects/dumont-lab/uma/k31/GCcontent"  

####################################

fname = file.path(path,f)
n = gsub("", "", f)
df = read.csv(fname, header = TRUE)
df <- df[,-1]

  df[,2] <- as.numeric(df[,2])

  loessMod30 <- loess(df[,2] ~ df[,4], data=df, span=0.3)
  loessMod40 <- loess(df[,2] ~ df[,4], data=df, span=0.4)
  
  smoothed30 <- predict(loessMod30)
  smoothed40 <- predict(loessMod40)
  
  smoothed30df <- cbind(smoothed30,df[,4])
  smoothed30df <- as.data.frame(smoothed30df)
  smoothed30df <- distinct(smoothed30df)
  name <- paste(f,".subset1.smoothed30.txt", sep = "")
  write.table(smoothed30df, file = name)
  
  filename = paste(f,".subset1.Loess30.svg",sep="")
  
  svg(filename = filename, 
    width = 9, 
    height = 6)
  
  plot(smoothed30,x=df[,4],type="p",main="Loess Smoothing (30) and Prediction", xlab="GC content", ylab=f,ylim = c(0,50))
  
    dev.off()
    
    smoothed40df <- cbind(smoothed40,df[,4])
  smoothed40df <- as.data.frame(smoothed40df)
  smoothed40df <- distinct(smoothed40df)
  name <- paste(f,".subset1.smoothed40.txt", sep = "")
  write.table(smoothed40df, file = name)
    
    filename = paste(f,".subset1.Loess40.svg",sep="")
  
  svg(filename = filename, 
    width = 9, 
    height = 9)
  
  plot(smoothed40,x=df[,4],type="p",main="Loess Smoothing (40) and Prediction", xlab="GC content", ylab=f,ylim = c(0,50))
  
    dev.off()

