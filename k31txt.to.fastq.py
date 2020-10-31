#!/urs/bin/env python

###Change input and output path###
pathinput='/projects/dumont-lab/uma/k31/k31txt/$1.fastq.k31.kmerscore.txt'
pathoutput='/fastscratch/uma/$1.k31.kmerscore.txt.fastq'

###Change numbers depending on k-mer length#####
with open(pathoutput,'w') as file1:
        with open(pathinput,'r', 1073741824) as file:
                for line in file:
                        line=line.rstrip()
                        file1.write('@')
                        ##Change number based on k
                        file1.write(line[0:31])
                        file1.write('_')
                        #Change number based on k
                        file1.write(line[32:])
                        file1.write('\n')
                        #Change number based on k
                        file1.write(line[0:31])
                        file1.write('\n')
                        file1.write('+')
                        file1.write('\n')
                        #Change number of characters based on k
                        file1.write('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM')
                        file1.write('\n')
file1.close()
file.close()
print('kmer fastq file made')