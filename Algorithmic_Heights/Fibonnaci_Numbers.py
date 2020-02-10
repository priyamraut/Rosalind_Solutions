x = int(input("Enter a positive integer to calculate the Fibonacci sum\n" ))
def Fibonacci_sum(int1):
    sum1 = 0  
    if int1 ==0:
        sum1=0
    elif int1 == 1:
        sum1=1
    else:
        sum1 = Fibonacci_sum(int1-1)+Fibonacci_sum(int1-2)
    return sum1

print(Fibonacci_sum(x))

