
setwd('~/Box Sync/Dumont_Lab/k-merDigging/centromere_kmers/copynumber/data/')
all <- read.table(file = 'final.set1.merge.h0.k15andk31.minorandmajor.txt', header = TRUE)

k31 <- all[all$K == 31,]
k31 <- as.data.frame(k31)

setwd('~/Box Sync/Dumont_Lab/k-merDigging/centromere_kmers/copynumber/k31_GCcorrection/data')
k31levelslist <- read.csv(file = 'levels.txt', header = FALSE)
#Remove pahari 39-41 bc they don't have any centromeric satellite kmers with h dist 0
k31levelslist <- as.data.frame(k31levelslist[-c(93:95),])

setwd('~/Box Sync/Dumont_Lab/k-merDigging/')
readcount <- read.csv(file = 'fastq.readcount.txt', header = FALSE, sep = '\t')
#Remove pahari 39-41 bc they don't have any centromeric satellite kmers with h dist 0
readcount <- as.data.frame(readcount[-c(93:95),])

k31levelslist <- as.data.frame(levels(k31$LIBRARY))
k31levelslist <- as.data.frame(k31levelslist[c(101,
102,
103,
106,
85,
93,
100,
104,
105,
89,
95,
97,
80,
87,
79,
88,
7,8,9,10,11,12,13,14,15,16,17,
60,61,62,63,64,65,66,67,68,69,
84,
90,
81,
94,
2,3,4,5,
38,39,
48,49,
58,59,
73,74,75,76,77,78,
115,116,117,118,119,120,121,
6,
70,71,72,
98,
1,
19,
22,
23,
25,
27,
29,
40,41,42,43,44,45,46,47,
50,51,52,53,54,55,56,57,
18,
20,21,
24,
26,
28,
30,31,32,33,34,35,36,37,
82,
92,
86,
96,
107,108,109,110,111,112,113,114,
83,
91,
99),])
colnames(k31levelslist) <- c("V1")
write.table(k31levelslist, file = 'levels.txt', col.names = FALSE, row.names = FALSE, quote = FALSE)

##########set path for where files are located###############
path = "~/Box Sync/Dumont_Lab/k-merDigging/centromere_kmers/copynumber/k31_GCcorrection/data"
fs = list.files(path, pattern = glob2rx("*.smoothed40.txt")) 

corrected <- data.frame(KMER = character(),
                        COUNT = integer(),
                        SAT = factor(),
                        HDIST = factor(),
                        STRAIN = factor(),
                        LIBRARY = factor(),
                        POPULATION = factor(),
                        TAXONOMY = factor(),
                        CON.SCR = factor(),
                        K = factor(),
                        GC = factor(),
                        CORRECTEDCOUNT = as.numeric()
)

k = 1
for (f in fs) {
  fname = file.path(path,f)
  n = gsub("", "", f)
  df = read.table(fname, header = TRUE)
  df$V2 <- round(df$V2,digits=5)
  all %>%
    subset(K == '31') %>%
    subset(LIBRARY == k31levelslist[k,1]) -> subset
  subset$GC <- round(subset$GC, digits=5)
  correctedcount <- vector()
  for (i in 1:nrow(subset)) {
    count <- subset[i,2]
    count <- 10^count
    count <- count * readcount[k,2]
    GC <- as.numeric(subset[i,11])
    predictedGC <- df[df$V2 == GC,1]
    count <- count/predictedGC
    #count <- count/readcount[k,2]
    count <- log10(count)
    correctedcount <- c(correctedcount,count)
  }
  subset$CORRECTEDCOUNT <- correctedcount
  corrected <- rbind(corrected,subset)
  k = k + 1
}

write.table(corrected, file = 'final.set1.k31.correctedcount.txt', row.names = FALSE)


