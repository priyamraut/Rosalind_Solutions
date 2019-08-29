#usr/bin/python3
DNA_string='AAAACCCGGT'
DNA_string=input("Input the input string")
Reverse_Compliment=''
if len(DNA_string) >1000:
    print("Warning: base pair length greater than 1000; continuing.")
for every_character in DNA_string:
    if every_character =='A':
        Reverse_Compliment='T'+Reverse_Compliment
    elif every_character =='G':
        Reverse_Compliment='C'+Reverse_Compliment
    elif every_character =='C':
        Reverse_Compliment='G'+Reverse_Compliment
    elif every_character =='T':
        Reverse_Compliment='A'+Reverse_Compliment
    else:
        print("Nucleotide other than AGCT")
print("Reverse Compliment is ")
print(Reverse_Compliment)
print(len(Reverse_Compliment))