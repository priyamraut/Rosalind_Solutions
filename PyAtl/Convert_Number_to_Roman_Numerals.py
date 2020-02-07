#Feb-6-2020
import sys
print("This script converts normal numbers to roman numeral")
x=int(input("Enter the integer to be converted\n"))

def print_roman(number):
    """
    Function to get the Integer from Roman Numeral 
    input : Integer
    output: String
    """ 
    roman_list=['M','D','C','L','X','V','I']
    number_list=[1000,500,100,50,10,5,1] 
    quotient_list=[]
    roman_string=''
    count=0
    for i in number_list:
        if number >= i:
            quotient_list.append(number//i)
            number = number%i
        else:
            quotient_list.append(0)
            continue     
    while count< len(number_list) :
        roman_string+=quotient_list[count]*roman_list[count]    
        count+=1
    roman_string = roman_string.replace('DCCCC','CM')
    roman_string = roman_string.replace('CCCC','CD')
    roman_string = roman_string.replace('LXXXX','XC')
    roman_string = roman_string.replace('XXXX','XL')
    roman_string = roman_string.replace('VIIII','IX')
    roman_string = roman_string.replace('IIII','IV')
    return roman_string

print("This roman numeral corresponding to number "+str(x) +" is ",end="")
print(print_roman(x))