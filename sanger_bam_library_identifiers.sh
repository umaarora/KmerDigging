#!/bin/bash

#PBS -l procs=1,mem=20gb,walltime=72:00:00
#PBS -m e

#############Load modules################
module load samtools/1.8

##########################################
#The following code is to extract library identifiers from bam files
#Genomes sequenced by the Sanger Mouse Genomes Project inbred mouse strains 
#were sequenced in one or more libraries from the same biological sample

#############Change file path################
PATHOUTPUT="/projects/dumont-lab/uma/Sangerbams/"
#############################################

samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | grep '@RG' > ${PATHOUTPUT}129P2.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/129S1_SvImJ.bam | grep '@RG' > ${PATHOUTPUT}129S1.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | grep '@RG' > ${PATHOUTPUT}129S5.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | grep '@RG' > ${PATHOUTPUT}AJ.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/C3H_HeJ.bam | grep '@RG' > ${PATHOUTPUT}C3H.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_6NJ.bam | grep '@RG' > ${PATHOUTPUT}B6N.header.txt
amtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/CAST_EiJ.bam | grep '@RG' > ${PATHOUTPUT}CAST.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_2J.bam | grep '@RG' > ${PATHOUTPUT}D2.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/FVB_NJ.bam | grep '@RG' > ${PATHOUTPUT}FVB.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/LEWES_EiJ.bam | grep '@RG' > ${PATHOUTPUT}LEWES.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/MOLF_EiJ.bam | grep '@RG' > ${PATHOUTPUT}MOLF.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/PWK_PhJ.bam | grep '@RG' > ${PATHOUTPUT}PWK.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/SPRET_EiJ.bam | grep '@RG' > ${PATHOUTPUT}SPRET.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/WSB_EiJ.bam | grep '@RG' > ${PATHOUTPUT}WSB.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/ZALENDE_EiJ.bam | grep '@RG' > ${PATHOUTPUT}ZALENDE.header.txt

samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/AKR_J.bam | grep '@RG' > ${PATHOUTPUT}AKR.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/BALB_cJ.bam | grep '@RG' > ${PATHOUTPUT}BALB.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/BUB_BnJ.bam | grep '@RG' > ${PATHOUTPUT}BUB.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_10J.bam | grep '@RG' > ${PATHOUTPUT}B10.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/CBA_J.bam | grep '@RG' > ${PATHOUTPUT}CBA.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/KK_HiJ.bam | grep '@RG' > ${PATHOUTPUT}KK.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/LP_J.bam | grep '@RG' > ${PATHOUTPUT}LP.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/NOD_ShiLtJ.bam | grep '@RG' > ${PATHOUTPUT}NOD.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/NZO_H1LtJ.bam | grep '@RG' > ${PATHOUTPUT}NZO.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/NZW_LacJ.bam | grep '@RG' > ${PATHOUTPUT}NZW.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/SM_J.bam | grep '@RG' > ${PATHOUTPUT}SM.header.txt

echo "job complete"