cat> $1.consensus.R << EOF

#!/bin/Rscript

################################################
##########load required libraries###############
###############################################
library(data.table)
library(plyr)
library(dplyr)
library(stringr)
library(tidyr)

######################################
#########Set working directory########
######################################
setwd('/projects/dumont-lab/uma/k31/mapped.sam/')

######################################
#########read mapped kmers file########
######################################
k31file <- read.delim(file = '$1.fastq.k31.kmerscore.txt.satellitekmers.mapped.sam', header = FALSE, sep = '\t')

######################################
#########subset and split columns########
######################################
k31file <- select(k31file, V1,V2,V3,V4,V6,V13)
k31file <- separate(k31file,col=V1,into=c("KMER","COUNT"),sep = '_')
k31file <- separate(k31file,col=V13,into=c("tag","i","HDIST"),sep = ':')
k31file <- select(k31file, KMER,COUNT,V2,V3,V4,V6,HDIST)
k31file[,2] <- as.integer(k31file[,2])

##########################################
#########split major and minor sat########
##########################################
k31major <- filter(k31file, V3 == 'MajorSatelliteConsensusWongandRattner1988x3')
k31major_r <- filter(k31major, V2 == 16)
k31major_f <- filter(k31major, V2 == 0)
rm(k31major)

k31minor <- filter(k31file, V3 == 'MinorSatelliteConsensusWongandRattner1988x3')
k31minor_r <- filter(k31minor, V2 == 16)
k31minor_f <- filter(k31minor, V2 == 0)
rm(k31minor)
rm(k31file)
#########################################################################
##########create a dataframe for minor and major sequences###############
#########################################################################
#Minor satellite
probscoreminsat_f <-data.frame(matrix(nrow = 360,ncol = 4))
colnames(probscoreminsat_f) <- c('A','T','G','C')
probscoreminsat_f[is.na(probscoreminsat_f)]<-0

probscoreminsat_r <-data.frame(matrix(nrow = 360,ncol = 4))
colnames(probscoreminsat_r) <- c('A','T','G','C')
probscoreminsat_r[is.na(probscoreminsat_r)]<-0

#Major satellite
probscoremajsat_f <-data.frame(matrix(nrow = 702,ncol = 4))
colnames(probscoremajsat_f) <- c('A','T','G','C')
probscoremajsat_f[is.na(probscoremajsat_f)]<-0

probscoremajsat_r <-data.frame(matrix(nrow = 702,ncol = 4))
colnames(probscoremajsat_r) <- c('A','T','G','C')
probscoremajsat_r[is.na(probscoremajsat_r)]<-0

#########################################
########Minor satellite forward#########
#########################################

df <- k31minor_f
  for (i in 1:nrow(df)) {
    kmer <- as.vector(df[i,1])
    kmer <- strsplit(kmer,split="")
    kmercount <- df[i,2]
    rownumber <- df[i,5]
      for (j in 1:31) {
      letter <- kmer[[1]][j]
      if (letter == "A"){
        probscoreminsat_f[rownumber,1]=probscoreminsat_f[rownumber,1]+kmercount
      } else if (letter == "T") {
        probscoreminsat_f[rownumber,2]=probscoreminsat_f[rownumber,2]+kmercount
      } else if (letter == "G") {
        probscoreminsat_f[rownumber,3]=probscoreminsat_f[rownumber,3]+kmercount
      } else if (letter == "C") {
        probscoreminsat_f[rownumber,4]=probscoreminsat_f[rownumber,4]+kmercount
      } 
        rownumber = rownumber + 1
      }
    }

  probscoreminsat_f[,5] <- probscoreminsat_f[,1] + probscoreminsat_f[,2] + probscoreminsat_f[,3] + probscoreminsat_f[,4]
#  probscoreminsat_f[,1] <- probscoreminsat_f[,1]/probscoreminsat_f[,5]
#  probscoreminsat_f[,2] <- probscoreminsat_f[,2]/probscoreminsat_f[,5]
#  probscoreminsat_f[,3] <- probscoreminsat_f[,3]/probscoreminsat_f[,5]
#  probscoreminsat_f[,4] <- probscoreminsat_f[,4]/probscoreminsat_f[,5]
#write out table  
  setwd('/projects/dumont-lab/uma/k31/consensus_separated')
  write.table(probscoreminsat_f,file = "$1.consensus.minor.forward.txt", sep = '\t', quote = FALSE, row.names = FALSE)

########################################
########Minor satellite reverse#########
#########################################
  
df <- k31minor_r
  for (i in 1:nrow(df)) {
    kmer <- as.vector(df[i,1])
    kmer <- strsplit(kmer,split="")
    kmercount <- df[i,2]
    rownumber <- df[i,5] + 30
    for (j in 1:31) {
      letter <- kmer[[1]][j]
      if (letter == "A"){
        probscoreminsat_r[rownumber,1]=probscoreminsat_r[rownumber,1]+kmercount
      } else if (letter == "T") {
        probscoreminsat_r[rownumber,2]=probscoreminsat_r[rownumber,2]+kmercount
      } else if (letter == "G") {
        probscoreminsat_r[rownumber,3]=probscoreminsat_r[rownumber,3]+kmercount
      } else if (letter == "C") {
        probscoreminsat_r[rownumber,4]=probscoreminsat_r[rownumber,4]+kmercount
      } 
        rownumber = rownumber - 1
  }
}
  
  probscoreminsat_r[,5] <- probscoreminsat_r[,1] + probscoreminsat_r[,2] + probscoreminsat_r[,3] + probscoreminsat_r[,4]
#  probscoreminsat_r[,1] <- probscoreminsat_r[,1]/probscoreminsat_r[,5]
#  probscoreminsat_r[,2] <- probscoreminsat_r[,2]/probscoreminsat_r[,5]
#  probscoreminsat_r[,3] <- probscoreminsat_r[,3]/probscoreminsat_r[,5]
#  probscoreminsat_r[,4] <- probscoreminsat_r[,4]/probscoreminsat_r[,5]
  #write out table  
  setwd('/projects/dumont-lab/uma/k31/consensus_separated')
  write.table(probscoreminsat_r,file = "$1.consensus.minor.reverse.txt", sep = '\t', quote = FALSE, row.names = FALSE)
  
#########################################
########Major satellite forward#########
#########################################
  
  df <- k31major_f
  for (i in 1:nrow(df)) {
    kmer <- as.vector(df[i,1])
    kmer <- strsplit(kmer,split="")
    kmercount <- df[i,2]
    rownumber <- df[i,5] 
    for (j in 1:31) {
      letter <- kmer[[1]][j]
      if (letter == "A"){
        probscoremajsat_f[rownumber,1]=probscoremajsat_f[rownumber,1]+kmercount
      } else if (letter == "T") {
        probscoremajsat_f[rownumber,2]=probscoremajsat_f[rownumber,2]+kmercount
      } else if (letter == "G") {
        probscoremajsat_f[rownumber,3]=probscoremajsat_f[rownumber,3]+kmercount
      } else if (letter == "C") {
        probscoremajsat_f[rownumber,4]=probscoremajsat_f[rownumber,4]+kmercount
      } 
        rownumber = rownumber + 1
    }
  }
  
  probscoremajsat_f[,5] <- probscoremajsat_f[,1] + probscoremajsat_f[,2] + probscoremajsat_f[,3] + probscoremajsat_f[,4]
#  probscoremajsat_f[,1] <- probscoremajsat_f[,1]/probscoremajsat_f[,5]
#  probscoremajsat_f[,2] <- probscoremajsat_f[,2]/probscoremajsat_f[,5]
#  probscoremajsat_f[,3] <- probscoremajsat_f[,3]/probscoremajsat_f[,5]
#  probscoremajsat_f[,4] <- probscoremajsat_f[,4]/probscoremajsat_f[,5]
  #write out table  
  setwd('/projects/dumont-lab/uma/k31/consensus_separated')
  write.table(probscoremajsat_f,file = "$1.consensus.major.forward.txt", sep = '\t', quote = FALSE, row.names = FALSE)
  
  ########################################
  ########major satellite reverse#########
  #########################################
  
  df <- k31major_r
  for (i in 1:nrow(df)) {
    kmer <- as.vector(df[i,1])
    kmer <- strsplit(kmer,split="")
    kmercount <- df[i,2]
    rownumber <- df[i,5] + 30
    for (j in 1:31) {
      letter <- kmer[[1]][j]
      if (letter == "A"){
        probscoremajsat_r[rownumber,1]=probscoremajsat_r[rownumber,1]+kmercount
      } else if (letter == "T") {
        probscoremajsat_r[rownumber,2]=probscoremajsat_r[rownumber,2]+kmercount
      } else if (letter == "G") {
        probscoremajsat_r[rownumber,3]=probscoremajsat_r[rownumber,3]+kmercount
      } else if (letter == "C") {
        probscoremajsat_r[rownumber,4]=probscoremajsat_r[rownumber,4]+kmercount
      } 
        rownumber = rownumber - 1
    }
  }
  
  probscoremajsat_r[,5] <- probscoremajsat_r[,1] + probscoremajsat_r[,2] + probscoremajsat_r[,3] + probscoremajsat_r[,4]
#  probscoremajsat_r[,1] <- probscoremajsat_r[,1]/probscoremajsat_r[,5]
#  probscoremajsat_r[,2] <- probscoremajsat_r[,2]/probscoremajsat_r[,5]
#  probscoremajsat_r[,3] <- probscoremajsat_r[,3]/probscoremajsat_r[,5]
#  probscoremajsat_r[,4] <- probscoremajsat_r[,4]/probscoremajsat_r[,5]
#write out table  
  setwd('/projects/dumont-lab/uma/k31/consensus_separated')
  write.table(probscoremajsat_r,file = "$1.consensus.major.reverse.txt", sep = '\t', quote = FALSE, row.names = FALSE)

EOF  
