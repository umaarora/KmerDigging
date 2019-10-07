#############################################################################################################
#Library identitfiers used to isolate reads from a particular library. 

#############Load modules################
module load samtools/1.8

#############Change file path################
PATHINPUT="/projects/dumont-lab/uma/Sangerbams/"
PATHOUTPUT="/projects/dumont-lab/uma/fastq/"
#############################################

#129P2/OlaHsd
samtools view -bhR ${PATHINPUT}129P2lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX200NOPCR.fastq
samtools view -bhR ${PATHINPUT}129P2lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX500HC.fastq
samtools view -bhR ${PATHINPUT}129P2lib3.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX500DSS.fastq
samtools view -bhR ${PATHINPUT}129P2lib4.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | samtools fastq - > ${PATHOUTPUT}129P2.SLX300DSS.fastq

#129S1/SvImJ
samtools view -bhR ${PATHINPUT}129S1lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S1_SvImJ.bam | samtools fastq - > ${PATHOUTPUT}129S1.LB3888089.fastq
samtools view -bhR ${PATHINPUT}129S1lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S1_SvImJ.bam | samtools fastq - > ${PATHOUTPUT}129S1.LB4505687.fastq

#129S5SvEvBrd
samtools view -bhR ${PATHINPUT}129S5lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | samtools fastq - > ${PATHOUTPUT}129S5.SLX200NOPCR.fastq
samtools view -bhR ${PATHINPUT}129S5lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | samtools fastq - > ${PATHOUTPUT}129S5.SLX300DSS.fastq
samtools view -bhR ${PATHINPUT}129S5lib3.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | samtools fastq - > ${PATHOUTPUT}129S5.SLX500DSS.fastq

#A/J
samtools view -bhR ${PATHINPUT}AJlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | samtools fastq - > ${PATHOUTPUT}AJ.LB7469040.fastq
samtools view -bhR ${PATHINPUT}AJlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | samtools fastq - > ${PATHOUTPUT}AJ.LB4505627.fastq
samtools view -bhR ${PATHINPUT}AJlib3.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | samtools fastq - > ${PATHOUTPUT}AJ.LB5442420.fastq

#C3H/HeJ
samtools view -bhR ${PATHINPUT}C3Hlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C3H_HeJ.bam | samtools fastq - > ${PATHOUTPUT}C3H.LB3888055.fastq
samtools view -bhR ${PATHINPUT}C3Hlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C3H_HeJ.bam | samtools fastq - > ${PATHOUTPUT}C3H.LB4505626.fastq

#C57BL/6NJ
samtools view -bhR ${PATHINPUT}B6Nlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_6NJ.bam | samtools fastq - > ${PATHOUTPUT}B6N.LB3888056.fastq
samtools view -bhR ${PATHINPUT}B6Nlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_6NJ.bam | samtools fastq - > ${PATHOUTPUT}B6N.LB4505614.fastq

#CAST/EiJ
samtools view -bhR ${PATHINPUT}CASTlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/CAST_EiJ.bam | samtools fastq - > ${PATHOUTPUT}CAST.LB3888061.fastq
samtools view -bhR ${PATHINPUT}CASTlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/CAST_EiJ.bam | samtools fastq - > ${PATHOUTPUT}CAST.LB4505650.fastq

#DBA/2J
samtools view -bhR ${PATHINPUT}D2lib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_2J.bam | samtools fastq - > ${PATHOUTPUT}D2.LB3888057.fastq
samtools view -bhR ${PATHINPUT}D2lib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_2J.bam | samtools fastq - > ${PATHOUTPUT}D2.LB4505698.fastq

#FVB/NJ
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/FVB_NJ.bam | samtools fastq - > /projects/dumont-lab/uma/sangerlibraries/FVB.fastq

#LEWES/EiJ
samtools view -bhR ${PATHINPUT}LEWESlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/LEWES_EiJ.bam | samtools fastq - > ${PATHOUTPUT}LEWES.LBA.fastq

#MOLF/EiJ
samtools view -bh ftp://ftp-mouse.sanger.ac.uk/current_bams/MOLF_EiJ.bam | samtools fastq - > /projects/dumont-lab/uma/sangerlibraries/MOLF.fastq

#PWK/PhJ
samtools view -bhR ${PATHINPUT}PWKlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/PWK_PhJ.bam | samtools fastq - > ${PATHOUTPUT}PWK.LB3888058.fastq
samtools view -bhR ${PATHINPUT}PWKlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/PWK_PhJ.bam | samtools fastq - > ${PATHOUTPUT}PWK.LB4505686.fastq

#SPRET/EiJ
samtools view -bhR ${PATHINPUT}SPRETlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/SPRET_EiJ.bam | samtools fastq - > ${PATHOUTPUT}SPRET.LB3888092.fastq
samtools view -bhR ${PATHINPUT}SPRETlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/SPRET_EiJ.bam | samtools fastq - > ${PATHOUTPUT}SPRET.LB5442432.fastq

#WSB/EiJ
samtools view -bhR ${PATHINPUT}WSBlib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/WSB_EiJ.bam | samtools fastq - > ${PATHOUTPUT}WSB.LB3888060.fastq
samtools view -bhR ${PATHINPUT}WSBlib2.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/WSB_EiJ.bam | samtools fastq - > ${PATHOUTPUT}WSB.LB4505662.fastq

#ZALENDE/EiJ
samtools view -bhR ${PATHINPUT}ZALENDElib1.txt ftp://ftp-mouse.sanger.ac.uk/current_bams/ZALENDE_EiJ.bam | samtools fastq - > ${PATHOUTPUT}ZALENDE.LBB.fastq


