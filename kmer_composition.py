# !/urs/bin/env python

#This custom python script takes input as a fastq file and makes an output with a table of k-mer (column 1) and count (column 2) 


##Change input and output file path here##
pathinput='.fastq'
pathoutput='.kmerscore.txt'
###########################################

##Function1:This function reads in a fastq file and scores kmers in a dictionary
def ReadFASTQ(fastq,k):
    kmerscore = {}
    chars='ATGCNatgcn'
    i=0
    n=0
    for line in fastq:
        line=line.rstrip()
        i+=1
        if line[0] in chars and i%4 !=0: ##some have > sign so switch chars to > AND i check to make sure phred score line is not read.
            for j in range(len(line)-(k-1)):
                kmer=line[j:j+k]
                n+=1
                if 'N' in kmer:
                    continue
                if 'n' in kmer:
                    continue
                if kmer in kmerscore:
                    kmerscore[kmer] = kmerscore[kmer] + 1
                elif kmer not in kmerscore:
                    kmerscore[kmer]=1
    print('kmer score from fastq file done')
    return kmerscore


k=15
#k=31

###read in fastq file
fastq=open(pathinput,'r')
kmerscore=ReadFASTQ(fastq,k)
fileoutput=open(pathoutput,'w')
for kmer,score in kmerscore.items():
    fileoutput.write(kmer)
    fileoutput.write('\t')
    fileoutput.write(str(score))
    fileoutput.write('\n')
fileoutput.close()
print('kmer tab separated file made')