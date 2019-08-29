#usr/bin/python3
string='AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
string=input("Input the input string")
Nucleotide_Dict={'A':0,'C':0,'G':0,'T':0}
for every_character in string:
    if every_character in Nucleotide_Dict:
        Nucleotide_Dict[every_character]+=1
    else:
        Nucleotide_Dict[every_character]=1

for every_key in Nucleotide_Dict:
    print(Nucleotide_Dict[every_key],end="\t")
