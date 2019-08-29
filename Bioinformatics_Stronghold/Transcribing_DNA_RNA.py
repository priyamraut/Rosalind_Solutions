#usr/bin/python3
DNA_string='GATGGAACTTGACTACGTAAATT'
DNA_string=input("Input the input string")
DNA_string_list=list(DNA_string)
DNA_string_2=str(DNA_string)
character_count=0
while character_count < len(DNA_string_list):
    if DNA_string_list[character_count]== 'T':
        DNA_string_list[character_count]='U'
    character_count+=1
RNA_string=''.join(DNA_string_list)
print("RNA string is ")
print(RNA_string)
