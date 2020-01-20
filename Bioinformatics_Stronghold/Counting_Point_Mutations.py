#usr/bin/python3
import sys
print("Implementing basic algorithm to calculate hamming distance")
DNA_string_1=input("Input the first input string\n")
DNA_string_2=input("Input the second input string\n")

if len(DNA_string_1)!=len(DNA_string_2):
    sys.exit("Error: The DNA strings are not of equal length")

if len(DNA_string_1) >  1000000 or len(DNA_string_2) > 1000000:
    sys.exit("Error: The DNA strings are more than 1kbps")

def hamming_distance(s,t):
    ham_dis = 0
    for i in range(0, len(s)):
        if s[i] != t[i]:
            ham_dis+=1
    return ham_dis
#print("The hamming distance is ")
print(hamming_distance(DNA_string_1,DNA_string_2))