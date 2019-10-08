#####################################2) Wild Mouse Genomes Project###########################################
#BAM files were accessed from ftp site and converted to fastq for downstream analysis
##############################################################################################################

#############Load modules################
module load samtools/1.8

#############Change file path################
PATHOUTPUT="/projects/dumont-lab/uma/fastq/"
#############################################

samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H12_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h12.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H14_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h14.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H15_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h15.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H24_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h24.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H26_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h26.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H27_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h27.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H28_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h28.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H30_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h30.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H34_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h34.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_castaneus/genomes_bam/H36_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}cast.h36.fastq


samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/14_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.14.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/15B_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.15B.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/16B_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.16B.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/18B_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.18B.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/AH15_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.AH15.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/AH23_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.AH23.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/B2C_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.B2C.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/C1_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.C1.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/E1_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.E1.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/F1B_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.F1B.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/JR11_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.JR11.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/JR15_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.JR15.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/JR2-F1C_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.JR2-F1C.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/JR5-F1C_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.JR5-F1C.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/JR7-F1C_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.JR7-F1C.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/JR8-F1A_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.JR8-F1A.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP121B_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP121B.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP1_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP1.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP3-92_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP3-92.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP4a_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP4a.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP51D_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP51D.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP7-10F1A2_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP7-10F1A2.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_domesticus/genomes_bam/TP81B_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}dom.TP81B.fastq

samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_helgolandicus/genomes_bam/SN7640133_6820_HG06.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}helg.HG06.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_helgolandicus/genomes_bam/SN7640133_6821_HG08.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}helg.HG08.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_helgolandicus/genomes_bam/SN7640133_6822_HG13.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}helg.HG13.fastq


samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/396_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.396.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/413_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.413.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/416_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.416.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/424_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.424.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/435_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.435.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/444_sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.444.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17072_AL1.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL1.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17073_AL16.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL16.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17074_AL19.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL19.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17075_AL33.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL1.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17076_AL38.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL38.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17077_AL40.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL40.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17078_AL41.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL41.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570284_17079_AL42.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.AL42.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17122_CR12.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR12.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17123_CR13.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR13.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17124_CR16.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR16.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17125_CR23.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR23.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17126_CR25.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR25.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17127_CR29.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR29.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17128_CR46.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR46.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_m_musculus/genomes_bam/SN4570285_17129_CR59.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}musc.CR59.fastq

samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17098_SP36.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP36.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17099_SP39.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP39.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17100_SP41.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP41.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17101_SP51.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP51.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17102_SP62.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP62.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17103_SP68.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP68.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17104_SP69.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP69.fastq
samtools bam2fq http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/m_spretus/genomes_bam/SN4570286_17105_SP70.sorted.cigar.nodups.realigned.recalibrated.sorted.bam > ${PATHOUTPUT}spret.SP70.fastq
