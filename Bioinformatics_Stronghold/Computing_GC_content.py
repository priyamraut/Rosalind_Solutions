#!usr/bin/python3

import argparse
from collections import defaultdict

parser = argparse.ArgumentParser(usage="python3 Computing_GC_content.py [-h] input_file.\n This program calculates GC content of a given sequence\\fasta file", description="")
parser.add_argument('fasta_file',type =str, help='Enter a genome file containing DNA sequence')
args = parser.parse_args()
input_file = args.fasta_file

#x = input("Enter at most 10 DNA strings\n")
Fasta_Dictionary={}
with open(input_file,'r') as fh:
    content = fh.readlines()
for every_line in content:
    if every_line.startswith('>'):
        header=every_line.rstrip('\n')[1:]
        Fasta_Dictionary[header]=''
    else:
        Fasta_Dictionary[header] += every_line.rstrip('\n')
#print(Fasta_Dictionary)
GC_Dict=defaultdict(int)
for every_key in Fasta_Dictionary:
    for each_nucleotide in Fasta_Dictionary[every_key]:
        if each_nucleotide == 'C' or each_nucleotide == 'G': 
            GC_Dict[every_key] +=1
    GC_Dict[every_key]*=100/len(Fasta_Dictionary[every_key])
#print(GC_Dict)
print(max(GC_Dict, key = GC_Dict.get))
print(max(GC_Dict.values()))
