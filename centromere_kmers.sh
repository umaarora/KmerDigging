#!/bin/bash
#PBS -l procs=16,mem=20gb,walltime=72:00:00
#PBS -m e

#This script is used to map the k-mers from the k-mer tables to a reference sequence 
#file centromere_consensus.fa consists of the minor and major consensus centromere sequences in tandem 3 times 

########Change library name here###########
LIBRARY=CAROLI34

module load bwa/0.7.9a
module load samtools/1.8

bwa aln -t 16 -n 4 centromere_consensus.fa ${LIBRARY}.fastq.k31.kmerscore.txt.fastq > ${LIBRARY}.fastq.k31.kmerscore.txt.sai
bwa samse centromere_consensus.fa ${LIBRARY}.fastq.k31.kmerscore.txt.sai ${LIBRARY}.fastq.k31.kmerscore.txt.satellitekmers.sam
samtools view -S -F4 ${LIBRARY}.fastq.k31.kmerscore.txt.satellitekmers.sam > ${LIBRARY}.fastq.k31.kmerscore.txt.satellitekmers.mapped.sam
rm ${LIBRARY}.fastq.k31.kmerscore.txt.sai
rm ${LIBRARY}.fastq.k31.kmerscore.txt.satellitekmers.sam
gzip ${LIBRARY}.fastq.k31.kmerscore.txt.fastq

