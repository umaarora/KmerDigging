# KmerDigging
Code and files used for paper Arora et al. (2020) titled "Population and species diversity at mouse centromere satellites" 

This manuscript utilizes publicly available sequencing data from 3 different projects:
1) Sanger mouse genomes project: ftp://ftp-mouse.sanger.ac.uk/current_bams/
2) Wild mouse genomes project: http://wwwuser.gwdg.de/~evolbio/evolgen/wildmouse/
3) Mus caroli and Mus pahari genome assemblies: "Repeat associated mechanisms of genome evolution and function revealed by the Mus caroli and Mus pahari genomes" DOI: 10.1101/gr.234096.117

Files used for plotting:

final.set1.k31.correctedcount.txt : containes centromere 31-mers, readcount normalized count, and GC corrected counts.

Pi_Estimation_metadata : contains Centromere Diversity Index values for samples

The order of scripts is as follows:

sanger_bam_library_identifiers.sh: Extract sanger bams sequencing library information

sanger_split_libraries.sh: Split sanger bams by sequencing libraries

caroli_pahari_process_fastq.sh: Download M. caroli and M. pahari fastq reads, map them to Mus musculus reference (mm10), remove optical duplicates, and convert back to fastq format.

wild_fastq.sh: Download wild mouse bam files into fastq format

kmer_composition.py: Python script to read in a fastq file and output a k-mer table, with k-mer in first column and frequency of occurence in the fastq file in the second column

k31txt.to.fastq.py: Convert k-mer table into fastq format for mapping to centromere consensus

centromere_kmers.sh: Use bwa to map k-mers to centromere consensus (at the top of the script is the centromere consensus fa file). Produces output mapped k-mer sam file.

process_mapped_sam.sh: process mapped k-mer sam file to make a dataframe

GC_calculation.R: calculate GC% of each k-mer in the table

GCcontent.py: Subsets k-mers for those that occur only once in the reference genome and calculates their GC%

GCLoess.R: Loess regression on subsetted k-mers that only occur once in the genome. Loess regression based on GC content.

GCcorrection.R: Correct each sample's raw k-mer counts by GC Loess regression predicted count 

Consensus_script.R: Calculate nucleotide frequency at each positionon minor and major consensus sequences using k-mer frequency and it's mapping position. 

CentromereMapping.sh: Maps sequencing readss to centromere consensus sequence

CentromereMapped_LocationSplit.py: Split mapped reads by location on consensus sequence they map to, and output a csv file compiling reads that map to each position on consensus sequence


