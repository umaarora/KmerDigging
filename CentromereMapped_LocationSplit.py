#!/urs/bin/env python
   
#This script splits mapped reads by position on the consensus sequence they map to
#All reads that map to a position are written out to a csv file
 
##import modules
import pandas as pd
print('libraries imported')

####Set paths of mapped sam file 
pathinput1 = '/projects/dumont-lab/uma/centromere_mapping/files/sample_Forward_bothEndsMapped.sam'
pathinput2 = '/projects/dumont-lab/uma/centromere_mapping/files/sample_Reverse_bothEndsMapped.sam'
print('paths read')

####################################
##Read in forward reads data frame##
####################################
col_names = ["col1", "col2", "col3", "col4", "col5", "col6", "col7", "col8", "col9", "col10", "col11", "col12", "col13", "col14", "col15", "col16", "col17"]
forward_reads = pd.read_table(pathinput1, sep = '\t', header = None, names = col_names)

##Remove rows that have reads that are not 100 bp
filter = (forward_reads['col10'].str.len() == 100)
forward_reads_100bp = forward_reads[filter]

##Separate minor and major satellite
major_reads = forward_reads_100bp[forward_reads_100bp['col3'] == 'MajorSatelliteConsensusWongandRattner1988x3']
minor_reads = forward_reads_100bp[forward_reads_100bp['col3'] == 'MinorSatelliteConsensusWongandRattner1988x3']

####Write out each position as a separate table
for i in range(360):
	position_subset = minor_reads[minor_reads['col4'] == i + 1]
	pathoutput = '/projects/dumont-lab/uma/centromere_mapping/files/CAST_Forward_minor_' + str(i) + '.csv'
	position_subset.to_csv(pathoutput)
	
####Write out each position as a separate table
for i in range(702):
	position_subset = major_reads[major_reads['col4'] == i + 1]
	pathoutput = '/projects/dumont-lab/uma/centromere_mapping/files/CAST_Forward_major_' + str(i) + '.csv'
	position_subset.to_csv(pathoutput)
	
####################################
##Read in reverse reads data frame##
####################################
col_names = ["col1", "col2", "col3", "col4", "col5", "col6", "col7", "col8", "col9", "col10", "col11", "col12", "col13", "col14", "col15", "col16", "col17"]
reverse_reads = pd.read_table(pathinput2, sep = '\t', header = None, names = col_names)

##Remove rows that have reads that are not 100 bp
filter = (reverse_reads['col10'].str.len() == 100)
reverse_reads_100bp = reverse_reads[filter]

##Separate minor and major satellite
major_reads = reverse_reads_100bp[reverse_reads_100bp['col3'] == 'MajorSatelliteConsensusWongandRattner1988x3']
minor_reads = reverse_reads_100bp[reverse_reads_100bp['col3'] == 'MinorSatelliteConsensusWongandRattner1988x3']

####Write out each position as a separate table
for i in range(360):
	position_subset = minor_reads[minor_reads['col4'] == i + 1]
	pathoutput = '/projects/dumont-lab/uma/centromere_mapping/files/CAST_Reverse_minor_' + str(i) + '.csv'
	position_subset.to_csv(pathoutput)
	
####Write out each position as a separate table
for i in range(702):
	position_subset = major_reads[major_reads['col4'] == i + 1]
	pathoutput = '/projects/dumont-lab/uma/centromere_mapping/files/CAST_Reverse_major_' + str(i) + '.csv'
	position_subset.to_csv(pathoutput)
