print("A permutation of length n is an ordering of the positive integers {1,2,…,n}. For example, π=(5,3,2,1,4) is a permutation of length 5.\
Given: A positive integer n≤7.Return: The total number of permutations of length n, followed by a list of all such permutations (in any order).")

from itertools import permutations 

x=int(input("Enter the length of the permutation\n"))
def factorial(number):
    fact=1
    for i in range(1,number+1):
        fact=fact*i
    return fact
total_number_of_permutations=factorial(x)
f = open('output.txt','w')
print(total_number_of_permutations,file=f)
list_perm=[]
for i in range(1,x+1):
    list_perm.append(i)
perm = permutations(list_perm)
for every_tuple in perm:
    for every_element in every_tuple:
        print(every_element,end=" ",file=f)
    print(end="\n",file=f)
f.close()   