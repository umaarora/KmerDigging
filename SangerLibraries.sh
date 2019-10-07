#####################################1) Sanger Mouse Genomes Project#########################################
#Sanger Mouse Genomes Project inbred mouse strains were sequenced in multiple libraries. 
#Each library is from the same biological sample. 
#Sequencing reads were split by each library, with details of library identifier described below

####################Extracting library identifiers from bam files#############################
#############Change file path################
PATH="/projects/dumont-lab/uma/Sangerbams/"
#############################################

samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/129P2_OlaHsd.bam | grep '@RG' > ${PATH}129P2.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/129S1_SvImJ.bam | grep '@RG' > ${PATH}129S1.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/129S5SvEvBrd.bam | grep '@RG' > ${PATH}129S5.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/A_J.bam | grep '@RG' > ${PATH}AJ.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/C3H_HeJ.bam | grep '@RG' > ${PATH}C3H.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/C57BL_6NJ.bam | grep '@RG' > ${PATH}B6N.header.txt
amtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/CAST_EiJ.bam | grep '@RG' > ${PATH}CAST.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/DBA_2J.bam | grep '@RG' > ${PATH}D2.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/FVB_NJ.bam | grep '@RG' > ${PATH}FVB.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/LEWES_EiJ.bam | grep '@RG' > ${PATH}LEWES.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/MOLF_EiJ.bam | grep '@RG' > ${PATH}MOLF.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/PWK_PhJ.bam | grep '@RG' > ${PATH}PWK.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/SPRET_EiJ.bam | grep '@RG' > ${PATH}SPRET.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/WSB_EiJ.bam | grep '@RG' > ${PATH}WSB.header.txt
samtools view -H ftp://ftp-mouse.sanger.ac.uk/current_bams/ZALENDE_EiJ.bam | grep '@RG' > ${PATH}ZALENDE.header.txt
