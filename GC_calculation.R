#Calculate GC content for k31mers

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

