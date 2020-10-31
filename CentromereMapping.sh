#!/bin/sh

#SBATCH -o %j.out # STDOUT
#SBATCH -e %j.err # STDERR
#SBATCH --mem 100G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=72:00:00

#This script reads sager and wild mouse bam file, collates them to split paired end reads
#Next, it maps the paired reads to the consensus centromere minor and major satellite sequences
#Next, it calculates the number of reads that maps to each, output into idxstats.txt file
#Last, it separates mapped reads, based on orientation of mapping (forward vs reverse strand)

##Load modules
module load singularity

SAMPLE='129S5'
INPUT='/projects/dumont-lab/uma/sangerlibraries'

singularity exec /home/arorau/samtools/samtools.sif samtools view -b -u -@ 16 ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | singularity exec /home/arorau/samtools/samtools.sif samtools collate -@ 16 -u - ${INPUT}/${SAMPLE}

singularity exec /home/arorau/samtools/samtools.sif samtools fastq -@ 16 ${INPUT}/${SAMPLE}.bam -1 ${INPUT}/${SAMPLE}_1.fastq -2 ${INPUT}/${SAMPLE}_2.fastq

REF='/projects/dumont-lab/uma/centromere_mapping/files'
OUTPUT='/projects/dumont-lab/uma/centromere_mapping/files'

singularity exec /home/arorau/bwa/bwa.sif bwa mem -t 16 ${REF}/centromere_consensus.fa ${INPUT}/${SAMPLE}_1.fastq ${INPUT}/${SAMPLE}_2.fastq > ${OUTPUT}/${SAMPLE}-pe.sam

singularity exec /home/arorau/samtools/samtools.sif samtools sort -@ 16 -o ${OUTPUT}/${SAMPLE}_sorted.bam ${OUTPUT}/${SAMPLE}-pe.sam

singularity exec /home/arorau/samtools/samtools.sif samtools index -@ 16 ${OUTPUT}/${SAMPLE}_sorted.bam

singularity exec /home/arorau/samtools/samtools.sif samtools idxstats ${OUTPUT}/${SAMPLE}_sorted.bam > ${OUTPUT}/${SAMPLE}.idxstats.txt

#Separate reads where both mates mapped
samtools view -h -F 12 -@ 30 ${OUTPUT}/${SAMPLE}-pe.sam > ${OUTPUT}/${SAMPLE}_bothEndsMapped.sam

#Separate forward and reverse strands
samtools view -F 16 -@ 30 ${OUTPUT}/${SAMPLE}_bothEndsMapped.sam > ${OUTPUT}/${SAMPLE}_Forward_bothEndsMapped.sam

samtools view -f 16 -@ 30 ${OUTPUT}/${SAMPLE}_bothEndsMapped.sam > ${OUTPUT}/${SAMPLE}_Reverse_bothEndsMapped.sam

#remove files that aren't required
rm ${OUTPUT}/${SAMPLE}-pe.sam
rm ${OUTPUT}/${SAMPLE}_sorted.bam

echo "job complete"