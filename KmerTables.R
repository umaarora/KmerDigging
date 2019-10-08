#######################################################################################
################################k15 code###############################################
#######################################################################################

#Do for major satellite, minor satellite, scramble minor, scramble major#
####################load required libraries#######################
library(plyr)
library(dplyr)
library(stringr)

#####################Read in readcount file#########################
setwd('/projects/dumont-lab/uma/consensus')
readcount <- read.csv(file = 'fastq.readcount.txt', header = FALSE, sep = "\t")

####################set working directory########################
setwd('/projects/dumont-lab/uma/kmerplots')

########################################################################################
##################################Major satellite#######################################
########################################################################################
path = "/projects/dumont-lab/uma/k15/satelliteKmers"                                       
fs = list.files(path, pattern = glob2rx("*.k15.majorsatellite.txt")) 

noGC <- data.frame(KMER = character(),
                   COUNT = integer(),
                   SAT = factor(),
                   HDIST = factor(),
                   STRAIN = factor(),
                   LIBRARY = factor(),
                   POPULATION = factor(),
                   TAXONOMY = factor(),
                   CON.SCR = factor(),
                   K = factor()
                   )

GC <- data.frame(KMER = character(),
                   COUNT = integer(),
                   SAT = factor(),
                   HDIST = factor(),
                   STRAIN = factor(),
                   LIBRARY = factor(),
                   POPULATION = factor(),
                   TAXONOMY = factor(),
                   CON.SCR = factor(),
                   K = factor(),
                   GC = factor()
)
  
k = 1
for(f in fs){    
  filename <- strsplit(f,".", fixed = TRUE)
  fname = file.path(path,f)
  file = read.table(fname, header = FALSE)
  
  file[,4] <- file[,3]
  file[,3] <- c("MAJOR")
  
  colnames(file) <- c("KMER","COUNT","SAT","HDIST")
  
  file$COUNT <- log10(file$COUNT/readcount[k,2])

  strain <- as.character(filename[[1]][1])
  file$STRAIN <- strain
  
  library <- as.character(filename[[1]][2])
  file$LIBRARY <- library
  
  file$POPULATION <- c("Inbred")
  
  file$TAXONOMY <- c("Mus musculus")
  
  file$CON.SCR <- c("CONSENSUS")
  
  if (strain == 'spret'){
    file$TAXONOMY <- c("Mus")
    file$POPULATION <- c("Wild")
  } else
    if (strain == 'SPRET'){
      file$TAXONOMY <- c("Mus")
    } else
      if (strain == 'CAROLI'){
        file$TAXONOMY <- c("Mus")
      } else
        if (strain == 'PAHARI'){
          file$TAXONOMY <- c("Mus")
        } else 
          if (strain == 'cast') {
            file$POPULATION <- c("Wild")
          } else 
            if (strain == 'dom') {
              file$POPULATION <- c("Wild")
            } else 
              if (strain == 'musc') {
                file$POPULATION <- c("Wild")
              }
  
  file$K <- c("15")
  noGC <- rbind(noGC,file)
  
  file <- file[file$HDIST == '0',]
  file$GC <- 0
  for (i in 1:nrow(file)) {
    kmer <- as.vector(file[i,1])
    kmer <- strsplit(kmer,split="")
    gc <- 0
    for (j in 1:15){
      letter <- kmer[[1]][j]
      if (letter == "G") {
        gc <- gc + 1
      } else if (letter == "C") {
        gc <- gc + 1
      }
    }
    file[i,11] <- (gc/15) * 100
  }
  GC <- rbind(GC,file)
  k = k + 1
}

write.table(noGC, file = 'k15.majorsatellite.txt', row.names = FALSE, quote = FALSE, col.names = FALSE)
write.table(GC, file = 'h0.GC.k15.majorsatellite.txt', row.names = FALSE, quote = FALSE,col.names = FALSE )

########################################################################################
######################################Minor satellite###################################
########################################################################################

path = "/projects/dumont-lab/uma/k15/satelliteKmers"                                       
fs = list.files(path, pattern = glob2rx("*.k15.minorsatellite.txt")) 

noGC <- data.frame(KMER = character(),
                   COUNT = integer(),
                   SAT = factor(),
                   HDIST = factor(),
                   STRAIN = factor(),
                   LIBRARY = factor(),
                   POPULATION = factor(),
                   TAXONOMY = factor(),
                   CON.SCR = factor(),
                   K = factor()
)

GC <- data.frame(KMER = character(),
                 COUNT = integer(),
                 SAT = factor(),
                 HDIST = factor(),
                 STRAIN = factor(),
                 LIBRARY = factor(),
                 POPULATION = factor(),
                 TAXONOMY = factor(),
                 CON.SCR = factor(),
                 K = factor(),
                 GC = factor()
)

k = 1
for(f in fs){    
  filename <- strsplit(f,".", fixed = TRUE)
  fname = file.path(path,f)
  file = read.table(fname, header = FALSE)
  
  file[,4] <- file[,3]
  file[,3] <- c("MINOR")
  
  colnames(file) <- c("KMER","COUNT","SAT","HDIST")
  
  file$COUNT <- log10(file$COUNT/readcount[k,2])
  
  strain <- as.character(filename[[1]][1])
  file$STRAIN <- strain
  
  library <- as.character(filename[[1]][2])
  file$LIBRARY <- library
  
  file$POPULATION <- c("Inbred")
  
  file$TAXONOMY <- c("Mus musculus")
  
  file$CON.SCR <- c("CONSENSUS")
  
  if (strain == 'spret'){
    file$TAXONOMY <- c("Mus")
    file$POPULATION <- c("Wild")
  } else
    if (strain == 'SPRET'){
      file$TAXONOMY <- c("Mus")
    } else
      if (strain == 'CAROLI'){
        file$TAXONOMY <- c("Mus")
      } else
        if (strain == 'PAHARI'){
          file$TAXONOMY <- c("Mus")
        } else 
          if (strain == 'cast') {
            file$POPULATION <- c("Wild")
          } else 
            if (strain == 'dom') {
              file$POPULATION <- c("Wild")
            } else 
              if (strain == 'musc') {
                file$POPULATION <- c("Wild")
              }
  
  file$K <- c("15")
  noGC <- rbind(noGC,file)
  
  file <- file[file$HDIST == '0',]
  file$GC <- 0
  for (i in 1:nrow(file)) {
    kmer <- as.vector(file[i,1])
    kmer <- strsplit(kmer,split="")
    gc <- 0
    for (j in 1:15){
      letter <- kmer[[1]][j]
      if (letter == "G") {
        gc <- gc + 1
      } else if (letter == "C") {
        gc <- gc + 1
      }
    }
    file[i,11] <- (gc/15) * 100
  }
  GC <- rbind(GC,file)
  k = k + 1
}

write.table(noGC, file = 'k15.minorsatellite.txt', row.names = FALSE, quote = FALSE, col.names = FALSE)
write.table(GC, file = 'h0.GC.k15.minorsatellite.txt', row.names = FALSE, quote = FALSE,col.names = FALSE )

########################################################################################
#############################SCRAMBLE Major satellite####################################
########################################################################################
path = "/projects/dumont-lab/uma/k15/satelliteKmers"                                       
fs = list.files(path, pattern = glob2rx("*.k15.scramble.majorsatellite.txt")) 

noGC <- data.frame(KMER = character(),
                   COUNT = integer(),
                   SAT = factor(),
                   HDIST = factor(),
                   STRAIN = factor(),
                   LIBRARY = factor(),
                   POPULATION = factor(),
                   TAXONOMY = factor(),
                   CON.SCR = factor(),
                   K = factor()
)

GC <- data.frame(KMER = character(),
                 COUNT = integer(),
                 SAT = factor(),
                 HDIST = factor(),
                 STRAIN = factor(),
                 LIBRARY = factor(),
                 POPULATION = factor(),
                 TAXONOMY = factor(),
                 CON.SCR = factor(),
                 K = factor(),
                 GC = factor()
)

k = 1
for(f in fs){    
  filename <- strsplit(f,".", fixed = TRUE)
  fname = file.path(path,f)
  file = read.table(fname, header = FALSE)
  
  file[,4] <- file[,3]
  file[,3] <- c("MAJOR")
  
  colnames(file) <- c("KMER","COUNT","SAT","HDIST")
  
  file$COUNT <- log10(file$COUNT/readcount[k,2])
  
  strain <- as.character(filename[[1]][1])
  file$STRAIN <- strain
  
  library <- as.character(filename[[1]][2])
  file$LIBRARY <- library
  
  file$POPULATION <- c("Inbred")
  
  file$TAXONOMY <- c("Mus musculus")
  
  file$CON.SCR <- c("SCRAMBLE")
  
  if (strain == 'spret'){
    file$TAXONOMY <- c("Mus")
    file$POPULATION <- c("Wild")
  } else
    if (strain == 'SPRET'){
      file$TAXONOMY <- c("Mus")
    } else
      if (strain == 'CAROLI'){
        file$TAXONOMY <- c("Mus")
      } else
        if (strain == 'PAHARI'){
          file$TAXONOMY <- c("Mus")
        } else 
          if (strain == 'cast') {
            file$POPULATION <- c("Wild")
          } else 
            if (strain == 'dom') {
              file$POPULATION <- c("Wild")
            } else 
              if (strain == 'musc') {
                file$POPULATION <- c("Wild")
              }
  
  file$K <- c("15")
  noGC <- rbind(noGC,file)
  
  file <- file[file$HDIST == '0',]
  file$GC <- 0
  for (i in 1:nrow(file)) {
    kmer <- as.vector(file[i,1])
    kmer <- strsplit(kmer,split="")
    gc <- 0
    for (j in 1:15){
      letter <- kmer[[1]][j]
      if (letter == "G") {
        gc <- gc + 1
      } else if (letter == "C") {
        gc <- gc + 1
      }
    }
    file[i,11] <- (gc/15) * 100
  }
  GC <- rbind(GC,file)
  k = k + 1
}

write.table(noGC, file = 'k15.scramble.majorsatellite.txt', row.names = FALSE, quote = FALSE, col.names = FALSE)
write.table(GC, file = 'h0.GC.k15.scramble.majorsatellite.txt', row.names = FALSE, quote = FALSE,col.names = FALSE )
########################################################################################
##########################SCRAMBLE Minor satellite######################################
########################################################################################
path = "/projects/dumont-lab/uma/k15/satelliteKmers"                                       
fs = list.files(path, pattern = glob2rx("*.k15.scramble.minorsatellite.txt")) 

noGC <- data.frame(KMER = character(),
                   COUNT = integer(),
                   SAT = factor(),
                   HDIST = factor(),
                   STRAIN = factor(),
                   LIBRARY = factor(),
                   POPULATION = factor(),
                   TAXONOMY = factor(),
                   CON.SCR = factor(),
                   K = factor()
)

GC <- data.frame(KMER = character(),
                 COUNT = integer(),
                 SAT = factor(),
                 HDIST = factor(),
                 STRAIN = factor(),
                 LIBRARY = factor(),
                 POPULATION = factor(),
                 TAXONOMY = factor(),
                 CON.SCR = factor(),
                 K = factor(),
                 GC = factor()
)

k = 1
for(f in fs){    
  filename <- strsplit(f,".", fixed = TRUE)
  fname = file.path(path,f)
  file = read.table(fname, header = FALSE)
  
  file[,4] <- file[,3]
  file[,3] <- c("MINOR")
  
  colnames(file) <- c("KMER","COUNT","SAT","HDIST")
  
  file$COUNT <- log10(file$COUNT/readcount[k,2])
  
  strain <- as.character(filename[[1]][1])
  file$STRAIN <- strain
  
  library <- as.character(filename[[1]][2])
  file$LIBRARY <- library
  
  file$POPULATION <- c("Inbred")
  
  file$TAXONOMY <- c("Mus musculus")
  
  file$CON.SCR <- c("SCRAMBLE")
  
  if (strain == 'spret'){
    file$TAXONOMY <- c("Mus")
    file$POPULATION <- c("Wild")
  } else
    if (strain == 'SPRET'){
      file$TAXONOMY <- c("Mus")
    } else
      if (strain == 'CAROLI'){
        file$TAXONOMY <- c("Mus")
      } else
        if (strain == 'PAHARI'){
          file$TAXONOMY <- c("Mus")
        } else 
          if (strain == 'cast') {
            file$POPULATION <- c("Wild")
          } else 
            if (strain == 'dom') {
              file$POPULATION <- c("Wild")
            } else 
              if (strain == 'musc') {
                file$POPULATION <- c("Wild")
              }
  
  file$K <- c("15")
  noGC <- rbind(noGC,file)
  
  file <- file[file$HDIST == '0',]
  file$GC <- 0
  for (i in 1:nrow(file)) {
    kmer <- as.vector(file[i,1])
    kmer <- strsplit(kmer,split="")
    gc <- 0
    for (j in 1:15){
      letter <- kmer[[1]][j]
      if (letter == "G") {
        gc <- gc + 1
      } else if (letter == "C") {
        gc <- gc + 1
      }
    }
    file[i,11] <- (gc/15) * 100
  }
  GC <- rbind(GC,file)
  k = k + 1
}

write.table(noGC, file = 'k15.scramble.minorsatellite.txt', row.names = FALSE, quote = FALSE, col.names = FALSE)
write.table(GC, file = 'h0.GC.k15.scramble.minorsatellite.txt', row.names = FALSE, quote = FALSE,col.names = FALSE )


#######################################################################################
################################k31 code###############################################
#######################################################################################

path = "/projects/dumont-lab/uma/k31/mapped.sam"                                       
fs = list.files(path, pattern = glob2rx("*.k31.kmerscore.txt.satellitekmers.mapped.sam")) 

k = 1
for (f in fs){

  filename <- strsplit(f,".", fixed = TRUE)
  fname = file.path(path,f)
  k31file = read.delim(fname, header = FALSE, sep = '\t')

  k31file <- select(k31file, V1,V3,V13)
  k31file <- separate(k31file,col=V1,into=c("KMER","COUNT"),sep = '_')
  k31file <- separate(k31file,col=V13,into=c("tag","i","HDIST"),sep = ':')
  k31file <- select(k31file, KMER,COUNT,V3,HDIST)
  k31file$COUNT <- as.numeric(k31file$COUNT)
  k31file$COUNT <- log10(k31file$COUNT/readcount[k,2])

  strain <- as.character(filename[[1]][1])
  file$STRAIN <- strain

  library <- as.character(filename[[1]][2])
  file$LIBRARY <- library

  file$POPULATION <- c("Inbred")

  file$TAXONOMY <- c("Mus musculus")

if (strain == 'spret'){
  k31file$TAXONOMY <- c("Mus")
  k31file$POPULATION <- c("Wild")
} else
  if (strain == 'SPRET'){
    k31file$TAXONOMY <- c("Mus")
  } else
    if (strain == 'CAROLI'){
      k31file$TAXONOMY <- c("Mus")
    } else
      if (strain == 'PAHARI'){
        k31file$TAXONOMY <- c("Mus")
      } else 
        if (strain == 'cast') {
          k31file$POPULATION <- c("Wild")
        } else 
          if (strain == 'dom') {
            k31file$POPULATION <- c("Wild")
          } else 
            if (strain == 'musc') {
              k31file$POPULATION <- c("Wild")
            }

  k31major <- k31file[k31file$V3 == 'MajorSatelliteConsensusWongandRattner1988x3',]
  k31major$V3 <- c("MAJOR")
  k31major$CON.SCR <- c("CONSENSUS")

  k31minor <- k31file[k31file$V3 == 'MinorSatelliteConsensusWongandRattner1988x3',]
  k31minor$V3 <- c("MINOR")
  k31minor$CON.SCR <- c("CONSENSUS")

  k31majorsc <- k31file[k31file$V3 == 'ScrambleMajorSatelliteConsensusWongandRattner1988x3',]
  k31majorsc$V3 <- c("MAJOR")
  k31majorsc$CON.SCR <- c("SCRAMBLE")

  k31minorsc <- k31file[k31file$V3 == 'ScrambleMinorSatelliteConsensusWongandRattner1988x3',]
  k31minorsc$V3 <- c("MINOR")
  k31minorsc$CON.SCR <- c("SCRAMBLE")

  minorsat <- rbind(k31minor,k31minorsc)
  majorsat <- rbind(k31major,k31majorsc)
  
  minorsat$K <- c("31")
  majorsat$K <- c("31")

  outputname <- paste(filename[[1]][1],".",filename[[1]][2],".", sep="")

  write.table(minorsat,file = paste(outputname,"k31.minorsatellite.txt",sep=""), row.names = FALSE, col.names = TRUE, quote = FALSE)
  write.table(majorsat,file = paste(outputname,"k31.majorsatellite.txt",sep=""), row.names = FALSE, col.names = TRUE, quote = FALSE)
k = k + 1
}

#######################################################################################
###################################K31 GC#########################################
#######################################################################################

path = "/projects/dumont-lab/uma/kmerplots"                                       
fs = list.files(path, pattern = glob2rx("*.k31.minorsatellite.txt")) 

GC <- data.frame(KMER = character(),
                 COUNT = integer(),
                 SAT = factor(),
                 HDIST = factor(),
                 STRAIN = factor(),
                 LIBRARY = factor(),
                 POPULATION = factor(),
                 TAXONOMY = factor(),
                 CON.SCR = factor(),
                 K = factor(),
                 GC = factor()
)

for (f in fs){
  fname = file.path(path,f)
  file = read.table(fname, header = TRUE, sep = '\t')
  file <- file[file$HDIST == '0',]
  file$GC <- 0
  for (i in 1:nrow(file)) {
    kmer <- as.vector(file[i,1])
    kmer <- strsplit(kmer,split="")
    gc <- 0
    for (j in 1:31){
      letter <- kmer[[1]][j]
      if (letter == "G") {
        gc <- gc + 1
      } else if (letter == "C") {
        gc <- gc + 1
      }
    }
    file[i,11] <- (gc/31) * 100
  }
  GC <- rbind(GC,file)
}

path = "/projects/dumont-lab/uma/kmerplots"                                       
fs = list.files(path, pattern = glob2rx("*.k31.majorsatellite.txt")) 

for (f in fs){
  fname = file.path(path,f)
  file = read.table(fname, header = TRUE, sep = '\t')
  file <- file[file$HDIST == '0',]
  file$GC <- 0
  for (i in 1:nrow(file)) {
    kmer <- as.vector(file[i,1])
    kmer <- strsplit(kmer,split="")
    gc <- 0
    for (j in 1:31){
      letter <- kmer[[1]][j]
      if (letter == "G") {
        gc <- gc + 1
      } else if (letter == "C") {
        gc <- gc + 1
      }
    }
    file[i,11] <- (gc/31) * 100
  }
  GC <- rbind(GC,file)
}

write.table(GC, file = 'h0.GC.k31.txt', row.names = FALSE, quote = FALSE,col.names = FALSE )
