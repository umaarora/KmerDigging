# KmerDigging
Code and files used for paper Arora et al. (2020) titled "Population and species diversity at mouse centromere satellites" 

This manuscript utilizes publicly available sequencing data from 3 different projects:
1) Sanger mouse genomes project: ftp://ftp-mouse.sanger.ac.uk/current_bams/
2) Wild mouse genomes project: http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/
3) Mus caroli and Mus pahari genome assemblies: "Repeat associated mechanisms of genome evolution and function revealed by the Mus caroli and Mus pahari genomes" DOI: 10.1101/gr.234096.117

The order of scripts is as follows:

sanger_bam_library_identifiers.sh: Extract sanger bams sequencing library information

sanger_split_libraries.sh: Split sanger bams by sequencing libraries

caroli_pahari_process_fastq.sh: Download M. caroli and M. pahari fastq reads, map them to Mus musculus reference (mm10), remove optical duplicates, and convert back to fastq format.

wild_fastq.sh: Download wild mouse bam files into fastq format

kmer_composition.py: Python script to read in a fastq file and output a k-mer table, with k-mer in first column and frequency of occurence in the fastq file in the second column

k31txt.to.fastq.py: Convert k-mer table into fastq format for mapping to centromere consensus

centromere_kmers.sh: Map k-mers to centromere consensus (at the top of the script is the centromere consensus fa file)

process_mapped_sam: process mapped k-mer sam file to make a dataframe

GC_calculation: calculate GC% of each k-mer in the table

GCcontent.py: Subsets k-mers for those that occur only once in the reference genome and calculates their GC%

GCLoess.R: Loess regression on subsetted k-mers that only occur once in the genome. Loess regression based on GC content.

GCcorrection: Correct each sample's raw k-mer counts by GC Loess regression predicted count 
