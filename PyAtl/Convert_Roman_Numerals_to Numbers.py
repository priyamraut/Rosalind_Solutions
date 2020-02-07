import sys
#Feb-6-2020
print("This script converts roman numeral to normal numbers")
x=input("Enter the roman numeral to be converted\n")

if type(x) != str :
  sys.exit("An exception occurred")

def print_numeral(roman):
    """
    Function to get the Integer from Roman Numeral 
    input : An integer
    output: Roman Numeral as string
    """
    roman_dict={'M':1000,'D':500,'C':100,'L':50,'X':10,'V':5,'I':1}
    #number_list=[1000,500,100,50,10,5,1]
    roman = roman.replace('CM','DCCCC')
    roman = roman.replace('CD','CCCC')
    roman = roman.replace('XC','LXXXX')
    roman = roman.replace('XL','XXXX')
    roman = roman.replace('IX','VIIII')
    roman = roman.replace('IV','IIII')
    int_number=0
    for i in roman:
        int_number+= roman_dict[i]   
    return int_number
print("This number corresponding to roman numeral "+str(x) +" is ",end="")
print(print_numeral(x))