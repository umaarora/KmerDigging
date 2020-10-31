# !/urs/bin/env python

#this script takes the k-mers from the reference and subsets k-mers that occur only once in the reference
#Next, it takes the k-mer tables from the samples, and subsets them for the k-mers that occur only once in the reference
#Next, it calculates the GC content of those subsetted k-mers, 
#Next, it writes out a random subset of 100,000 of them for downstream correction with Loess regression 

##Set paths of k31 txt file and reference k31 file##
pathinput1 = '/projects/dumont-lab/uma/k31/k31txt/$1'
#Break down mouse reference (mm10) into k-mer table
pathinput2 = '/projects/dumont-lab/uma/mousereference/mousereference.k31.kmerscore.txt'
print('paths read')

##import modules
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import pandas as pd
import Bio
import numpy as np
#import statsmodels.api as sm
print('libraries imported')

##Read in data frame
kmers = pd.read_table(pathinput1, sep = ' ', header = None)
kmers.columns = [0, '$1']
print('dataframe 1 has been read')

##Read in reference
reference = pd.read_table(pathinput2, sep='\t', header = None)
reference.columns = [0, 'ref']
reference = reference[reference.ref == 1]
print('dataframe 2 has been read')

##Merge dataframes
#dataframes = [kmers, reference] #Makes a list of the dataframes
merged = pd.merge(reference, kmers, how = 'left')
merged = merged.replace(to_replace = 'NaN', value = 0)
merged.reset_index(drop=True,inplace=True)
print('dataframes have been merged and kmers with one occurance in reference subsetted')
kmers = None
reference = None


##add GC content column
from Bio.Seq import Seq
GCcolumn = []
for i in range(len(merged.index)):
        seq = Seq(merged.iloc[i,0])
        gc = float(100.0 * (seq.count("G") + seq.count("C")) / (31 * 1.0))
        GCcolumn.append(gc)

print('GC loop completed')
merged['GC'] = GCcolumn
print('GC column added to dataframe')

####Write out file
merged.to_csv('/projects/dumont-lab/uma/k31/GCcontent/$1.GCcontent.txt')
print('merged dataframe written out')

merged = pd.read_table('/projects/dumont-lab/uma/k31/GCcontent/$1.GCcontent.txt', sep = ',')
merged_subset = merged.sample(n=100000)
merged_subset.to_csv('/projects/dumont-lab/uma/k31/GCcontent/$1.GCcontent.subset.txt')

###Make boxplots
merged["GC"] =  merged["GC"].astype('category')
plt.figure(figsize=(9,9))
merged.boxplot(column = '$1', by = 'GC')
plt.xticks(rotation=90)
plt.ylim(0,1000000)
plt.savefig('/projects/dumont-lab/uma/k31/GCcontent/$1.GCboxplot.png')





	