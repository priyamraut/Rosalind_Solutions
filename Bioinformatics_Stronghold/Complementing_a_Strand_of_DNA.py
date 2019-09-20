#usr/bin/python3
DNA_string='AAAACCCGGT'
DNA_string=input("Input the input string")
Reverse_Complement=''
if len(DNA_string) >1000:
    print("Warning: base pair length greater than 1000; continuing.")
for every_character in DNA_string:
    if every_character =='A':
        Reverse_Complement='T'+Reverse_Complement
    elif every_character =='G':
        Reverse_Complement='C'+Reverse_Complement
    elif every_character =='C':
        Reverse_Complement='G'+Reverse_Complement
    elif every_character =='T':
        Reverse_Complement='A'+Reverse_Complement
    else:
        print("Nucleotide other than AGCT")
print("Reverse Compliment is ")
print(Reverse_Complement)
print(len(Reverse_Complement))