sra_caroli_list.txt
ERR1545528.fastq
ERR1545529.fastq
ERR1545530.fastq
ERR1545531.fastq
ERR1545532.fastq
ERR1545533.fastq
ERR1545534.fastq
ERR1545535.fastq
ERR1545536.fastq
ERR1545537.fastq
ERR1545538.fastq

sra_pahari_list.txt
ERR1545539.fastq
ERR1545540.fastq
ERR1545541.fastq
ERR1545542.fastq
ERR1545543.fastq
ERR1545544.fastq
ERR1545545.fastq
ERR1545546.fastq
ERR1545547.fastq
ERR1545548.fastq
ERR1545549.fastq
ERR1545550.fastq
ERR1545551.fastq
ERR1545552.fastq

#!/bin/bash

#PBS -l procs=1,mem=20gb,walltime=500:00:00
#PBS -m e
#PBS -q long

#############Load modules################
module load samtools/1.8
module load sratoolkit/2.9.2

##########################################
#The following code is to download and process fastq files for Mus caroli and Mus pahari
#FASTQ files are from a whole genome sequencing project of these species
#Genomes sequenced by the Wild Mouse Genomes Project represent individuals of the respective inbred strains CAROLI/eiJ and PAHARI/EiJ

#############Change file path################
OUTPUTDIR="/projects/dumont-lab/uma/fastq/"
REFPATH="/data/shared/genomes/Mus_musculus/UCSC/mm10/Sequence/BWAIndex/"
#############################################

while read i; do
        fastq-dump -o ${OUTPUTDIR}
done < /projects/dumont-lab/uma/k31/scripts/sra_caroli_list.txt

while read i; do
        fastq-dump -o ${OUTPUTDIR}
done < /projects/dumont-lab/uma/k31/scripts/sra_pahari_list.txt

################Map reads to reference genome (C57BL/6)########################
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545528.fastq > ${OUTPUTDIR}bam/CAROLI28.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545529.fastq > ${OUTPUTDIR}bam/CAROLI29.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545530.fastq > ${OUTPUTDIR}bam/CAROLI30.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545531.fastq > ${OUTPUTDIR}bam/CAROLI31.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545532.fastq > ${OUTPUTDIR}bam/CAROLI32.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545533.fastq > ${OUTPUTDIR}bam/CAROLI33.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545534.fastq > ${OUTPUTDIR}bam/CAROLI34.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545535.fastq > ${OUTPUTDIR}bam/CAROLI35.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545536.fastq > ${OUTPUTDIR}bam/CAROLI36.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545537.fastq > ${OUTPUTDIR}bam/CAROLI37.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545538.fastq > ${OUTPUTDIR}bam/CAROLI38.bam

bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545540.fastq > ${OUTPUTDIR}bam/PAHARI40.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545541.fastq > ${OUTPUTDIR}bam/PAHARI41.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545542.fastq > ${OUTPUTDIR}bam/PAHARI42.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545543.fastq > ${OUTPUTDIR}bam/PAHARI43.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545544.fastq > ${OUTPUTDIR}bam/PAHARI44.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545545.fastq > ${OUTPUTDIR}bam/PAHARI45.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545546.fastq > ${OUTPUTDIR}bam/PAHARI46.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545547.fastq > ${OUTPUTDIR}bam/PAHARI47.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545548.fastq > ${OUTPUTDIR}bam/PAHARI48.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545549.fastq > ${OUTPUTDIR}bam/PAHARI49.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545550.fastq > ${OUTPUTDIR}bam/PAHARI50.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545551.fastq > ${OUTPUTDIR}bam/PAHARI51.bam
bwa mem -t 16 ${REFPATH}genome.fa ${OUTPUTDIR}/ERR1545552.fastq > ${OUTPUTDIR}bam/PAHARI52.bam

############################Sort bam file################################
samtools sort -o ${OUTPUTDIR}bam/CAROLI28.sorted.bam ${OUTPUTDIR}bam/CAROLI28.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI29.sorted.bam ${OUTPUTDIR}bam/CAROLI29.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI30.sorted.bam ${OUTPUTDIR}bam/CAROLI30.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI31.sorted.bam ${OUTPUTDIR}bam/CAROLI31.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI32.sorted.bam ${OUTPUTDIR}bam/CAROLI32.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI33.sorted.bam ${OUTPUTDIR}bam/CAROLI33.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI34.sorted.bam ${OUTPUTDIR}bam/CAROLI34.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI35.sorted.bam ${OUTPUTDIR}bam/CAROLI35.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI36.sorted.bam ${OUTPUTDIR}bam/CAROLI36.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI37.sorted.bam ${OUTPUTDIR}bam/CAROLI37.bam
samtools sort -o ${OUTPUTDIR}bam/CAROLI38.sorted.bam ${OUTPUTDIR}bam/CAROLI38.bam

samtools sort -o ${OUTPUTDIR}bam/PAHARI40.sorted.bam ${OUTPUTDIR}bam/PAHARI40.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI41.sorted.bam ${OUTPUTDIR}bam/PAHARI41.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI42.sorted.bam ${OUTPUTDIR}bam/PAHARI42.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI43.sorted.bam ${OUTPUTDIR}bam/PAHARI43.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI44.sorted.bam ${OUTPUTDIR}bam/PAHARI44.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI45.sorted.bam ${OUTPUTDIR}bam/PAHARI45.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI46.sorted.bam ${OUTPUTDIR}bam/PAHARI46.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI47.sorted.bam ${OUTPUTDIR}bam/PAHARI47.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI48.sorted.bam ${OUTPUTDIR}bam/PAHARI48.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI49.sorted.bam ${OUTPUTDIR}bam/PAHARI49.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI50.sorted.bam ${OUTPUTDIR}bam/PAHARI50.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI51.sorted.bam ${OUTPUTDIR}bam/PAHARI51.bam
samtools sort -o ${OUTPUTDIR}bam/PAHARI52.sorted.bam ${OUTPUTDIR}bam/PAHARI52.bam

#######################Remove optical duplicates############################
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI28.sorted.bam ${OUTPUTDIR}bam/CAROLI28.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI29.sorted.bam ${OUTPUTDIR}bam/CAROLI29.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI30.sorted.bam ${OUTPUTDIR}bam/CAROLI30.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI31.sorted.bam ${OUTPUTDIR}bam/CAROLI31.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI32.sorted.bam ${OUTPUTDIR}bam/CAROLI32.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI33.sorted.bam ${OUTPUTDIR}bam/CAROLI33.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI34.sorted.bam ${OUTPUTDIR}bam/CAROLI34.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI35.sorted.bam ${OUTPUTDIR}bam/CAROLI35.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI36.sorted.bam ${OUTPUTDIR}bam/CAROLI36.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI37.sorted.bam ${OUTPUTDIR}bam/CAROLI37.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/CAROLI38.sorted.bam ${OUTPUTDIR}bam/CAROLI38.nodups.sorted.bam

samtools rmdup -S ${OUTPUTDIR}bam/PAHARI40.sorted.bam ${OUTPUTDIR}bam/PAHARI40.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI41.sorted.bam ${OUTPUTDIR}bam/PAHARI41.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI42.sorted.bam ${OUTPUTDIR}bam/PAHARI42.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI43.sorted.bam ${OUTPUTDIR}bam/PAHARI43.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI44.sorted.bam ${OUTPUTDIR}bam/PAHARI44.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI45.sorted.bam ${OUTPUTDIR}bam/PAHARI45.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI46.sorted.bam ${OUTPUTDIR}bam/PAHARI46.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI47.sorted.bam ${OUTPUTDIR}bam/PAHARI47.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI48.sorted.bam ${OUTPUTDIR}bam/PAHARI48.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI49.sorted.bam ${OUTPUTDIR}bam/PAHARI49.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI50.sorted.bam ${OUTPUTDIR}bam/PAHARI50.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI51.sorted.bam ${OUTPUTDIR}bam/PAHARI51.nodups.sorted.bam
samtools rmdup -S ${OUTPUTDIR}bam/PAHARI52.sorted.bam ${OUTPUTDIR}bam/PAHARI52.nodups.sorted.bam

#######################convert BAM into Fastq############################
samtools fastq ${OUTPUTDIR}bam/CAROLI28.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI28.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI29.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI29.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI30.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI30.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI31.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI31.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI32.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI32.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI33.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI33.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI34.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI34.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI35.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI35.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI36.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI36.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI37.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI37.fastq
samtools fastq ${OUTPUTDIR}bam/CAROLI38.nodups.sorted.bam > ${OUTPUTDIR}fastq/CAROLI38.fastq

samtools fastq ${OUTPUTDIR}bam/PAHARI40.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI40.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI41.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI41.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI42.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI42.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI43.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI43.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI44.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI44.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI45.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI45.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI46.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI46.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI47.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI47.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI48.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI48.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI49.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI49.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI50.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI50.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI51.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI51.fastq
samtools fastq ${OUTPUTDIR}bam/PAHARI52.nodups.sorted.bam > ${OUTPUTDIR}fastq/PAHARI52.fastq

echo "job complete"