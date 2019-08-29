#usr/bin/python3
DNA_string='ACGTTGCATGTCGCATGATGCATGAGAGCT'
#DNA_string=input("Input the input string")
kmer_length=4
#Pattern=int(input("Input the input string"))
def PatternCount(DNA_string,kmer_length):
    count=0
    kmer_dictionary={}
    while count < len(DNA_string)-kmer_length+1:
        key=DNA_string[count:count+kmer_length]
        if DNA_string[count:count+kmer_length] in kmer_dictionary:
            kmer_dictionary[key]+=1      
        else:
            kmer_dictionary[key]=1
        count+=1
    return kmer_dictionary
#PatternCount(DNA_string,kmer_length)
print(PatternCount(DNA_string,kmer_length))