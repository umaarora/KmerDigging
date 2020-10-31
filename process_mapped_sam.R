
#R script to process mapped sam files

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
  k31file$STRAIN <- strain
  
  library <- as.character(filename[[1]][2])
  k31file$LIBRARY <- library
  
  k31file$POPULATION <- c("Inbred")
  
  k31file$TAXONOMY <- c("Mus musculus")
  
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
  
  write.table(minorsat,file = paste(outputname,"k31.minorsatellite.txt",sep=""), row.names = FALSE, col.names = FALSE, quote = FALSE)
  write.table(majorsat,file = paste(outputname,"k31.majorsatellite.txt",sep=""), row.names = FALSE, col.names = FALSE, quote = FALSE)
  k = k + 1
}

