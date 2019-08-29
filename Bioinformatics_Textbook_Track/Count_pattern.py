#usr/bin/python3
DNA_string='AAAACCCGGT'
DNA_string=input("Input the input string")
Pattern="GGT"
Pattern=input("Input the input string")
def PatternCount(DNA_string,Pattern):
    value_of_count=0
    count=0
    while count < len(DNA_string)-len(Pattern)+1:
        #print(DNA_string[count:count+3])
        if DNA_string[count:count+len(Pattern)] == Pattern:
            value_of_count+=1        
        count+=1
    return value_of_count
print(PatternCount(DNA_string,Pattern))