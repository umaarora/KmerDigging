#!/bin/bash

#PBS -l procs=1,mem=20gb,walltime=500:00:00
#PBS -m e
#PBS -q long

#############Load modules################
module load samtools/1.8

##########################################
#The following code is to sort reads by sequencing library
#Genomes sequenced by the Sanger Mouse Genomes Project inbred mouse strains 
#were sequenced in one or more libraries from the same biological sample

#############Change file path################
PATHINPUT="/projects/dumont-lab/uma/Sangerbams/"
PATHOUTPUT="/projects/dumont-lab/uma/fastq/"
#############################################

samtools view -bhR ${PATHINPUT}CASTlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/CAST_EiJ.bam | samtools fastq - > ${PATHOUTPUT}CAST.LB3888061.fastq
samtools view -bhR ${PATHINPUT}CASTlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/CAST_EiJ.bam | samtools fastq - > ${PATHOUTPUT}CAST.LB4505650.fastq
samtools view -bhR ${PATHINPUT}AJlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | samtools fastq - > ${PATHOUTPUT}AJ.LB7469040.fastq
samtools view -bhR ${PATHINPUT}AJlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | samtools fastq - > ${PATHOUTPUT}AJ.LB4505627.fastq
samtools view -bhR ${PATHINPUT}AJlib3.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | samtools fastq - > ${PATHOUTPUT}AJ.LB5442420.fastq
samtools view -bhR ${PATHINPUT}129P2lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX200NOPCR.fastq
samtools view -bhR ${PATHINPUT}129P2lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX500HC.fastq
samtools view -bhR ${PATHINPUT}129P2lib3.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX500DSS.fastq
samtools view -bhR ${PATHINPUT}129P2lib4.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX300DSS.fastq
samtools view -bhR ${PATHINPUT}129S1lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S1_SvImJ.bam | samtools fastq - > ${PATHOUTPUT}129S1.LB3888089.fastq
samtools view -bhR ${PATHINPUT}129S1lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S1_SvImJ.bam | samtools fastq - > ${PATHOUTPUT}129S1.LB4505687.fastq
samtools view -bhR ${PATHINPUT}129S5lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | samtools fastq - > ${PATHOUTPUT}129S5.SLX200NOPCR.fastq
samtools view -bhR ${PATHINPUT}129S5lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | samtools fastq - > ${PATHOUTPUT}129S5.SLX300DSS.fastq
samtools view -bhR ${PATHINPUT}129S5lib3.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | samtools fastq - > ${PATHOUTPUT}129S5.SLX500DSS.fastq
samtools view -bhR ${PATHINPUT}B6Nlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_6NJ.bam | samtools fastq - > ${PATHOUTPUT}B6N.LB3888056.fastq
samtools view -bhR ${PATHINPUT}B6Nlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_6NJ.bam | samtools fastq - > ${PATHOUTPUT}B6N.LB4505614.fastq
samtools view -bhR ${PATHINPUT}C3Hlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C3H_HeJ.bam | samtools fastq - > ${PATHOUTPUT}C3H.LB3888055.fastq
samtools view -bhR ${PATHINPUT}C3Hlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C3H_HeJ.bam | samtools fastq - > ${PATHOUTPUT}C3H.LB4505626.fastq
samtools view -bhR ${PATHINPUT}D2lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_2J.bam | samtools fastq - > ${PATHOUTPUT}D2.LB3888057.fastq
samtools view -bhR ${PATHINPUT}D2lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_2J.bam | samtools fastq - > ${PATHOUTPUT}D2.LB4505698.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/MOLF_EiJ.bam | samtools fastq - > ${PATHOUTPUT}MOLF.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/ZALENDE_EiJ.bam | samtools fastq - > ${PATHOUTPUT}ZALENDE.LBB.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/LEWES_EiJ.bam | samtools fastq - > ${PATHOUTPUT}LEWES.LBA.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/FVB_NJ.bam | samtools fastq - > ${PATHOUTPUT}FVB.fastq
samtools view -bhR ${PATHINPUT}PWKlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/PWK_PhJ.bam | samtools fastq - > ${PATHOUTPUT}PWK.LB3888058.fastq
samtools view -bhR ${PATHINPUT}PWKlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/PWK_PhJ.bam | samtools fastq - > ${PATHOUTPUT}PWK.LB4505686.fastq
samtools view -bhR ${PATHINPUT}SPRETlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/SPRET_EiJ.bam | samtools fastq - > ${PATHOUTPUT}SPRET.LB3888092.fastq
samtools view -bhR ${PATHINPUT}SPRETlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/SPRET_EiJ.bam | samtools fastq - > ${PATHOUTPUT}SPRET.LB5442432.fastq
samtools view -bhR ${PATHINPUT}WSBlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/WSB_EiJ.bam | samtools fastq - > ${PATHOUTPUT}WSB.LB3888060.fastq
samtools view -bhR ${PATHINPUT}WSBlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/WSB_EiJ.bam | samtools fastq - > ${PATHOUTPUT}WSB.LB4505662.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_10J.bam | samtools fastq - > /projects/dumont-lab/uma/sangerlibraries/B10.3.fastq
samtools view -bhR ${PATHINPUT}BALBlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/BALB_cJ.bam | samtools fastq - > ${PATHOUTPUT}BALB.LB3888090.fastq
samtools view -bhR ${PATHINPUT}BALBlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/BALB_cJ.bam | samtools fastq - > ${PATHOUTPUT}BALB.LB4505675.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BR_cdJ.bam | samtools fastq - > ${PATHOUTPUT}C57BR.4.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/BTBR_T__Itpr3tf_J.bam | samtools fastq - > ${PATHOUTPUT}BTBR.5.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/BUB_BnJ.bam | samtools fastq - > ${PATHOUTPUT}BUB.6.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/C57L_J.bam | samtools fastq - > ${PATHOUTPUT}C57L.7.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/C58_J.bam | samtools fastq - > ${PATHOUTPUT}C58.8.fastq
samtools view -bhR ${PATHINPUT}CBAlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/CBA_J.bam | samtools fastq - > ${PATHOUTPUT}CBA.LB3888059.fastq
samtools view -bhR ${PATHINPUT}CBAlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/CBA_J.bam | samtools fastq - > ${PATHOUTPUT}CBA.LB4505674.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_1J.bam | samtools fastq - > ${PATHOUTPUT}D1.9.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/I_LnJ.bam | samtools fastq - > ${PATHOUTPUT}I.10.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/KK_HiJ.bam | samtools fastq - > ${PATHOUTPUT}KK.11.fastq
samtools view -bhR ${PATHINPUT}LPlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/LP_J.bam | samtools fastq - > ${PATHOUTPUT}LP.LB3888062.fastq
samtools view -bhR ${PATHINPUT}LPlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/LP_J.bam | samtools fastq - > ${PATHOUTPUT}LP.LB4505638.fastq
samtools view -bhR ${PATHINPUT}NODlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/NOD_ShiLtJ.bam | samtools fastq - > ${PATHOUTPUT}NOD.LB3888093.fastq
samtools view -bhR ${PATHINPUT}NODlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/NOD_ShiLtJ.bam | samtools fastq - > ${PATHOUTPUT}NOD.LB4505639.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/NZB_B1NJ.bam | samtools fastq - > ${PATHOUTPUT}NZB.12.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/NZW_LacJ.bam | samtools fastq - > ${PATHOUTPUT}NZW.13.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/RF_J.bam | samtools fastq - > ${PATHOUTPUT}RF.14.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/SEA_GnJ.bam | samtools fastq - > ${PATHOUTPUT}SEA.15.fastq
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/ST_bJ.bam | samtools fastq - > ${PATHOUTPUT}ST.16.fastq

echo "job complete"