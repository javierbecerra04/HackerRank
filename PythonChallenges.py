#Hello World!
print("Hello, world!")

#Python If-Else
if (n%2 != 0) or (n%2==0 and n>=6 and n<=20):
    print("Weird")
else:
    print("Not Weird")

#Arithmetic Operators
print(a+b)
print(a-b)
print(a*b)

#Python: Division
print(a//b) #// operator is used for floor division
print(a/b)

#Loops
if __name__ == '__main__':
    n = int(input())
    for i in range(0,n):
        print(i*i)

#Write a function
def is_leap(year):
    leap = False
    if (year%4==0) and (year%100!=0):
        leap=True
    else:
        if (year%100==0) and (year%400==0):
            leap=True       
    return leap

year = int(input())
print(is_leap(year))

#Print Function
def PrintFunction(n):
    a = ""
    for i in range(1,n+1):
        a=a+str(i)
    print(a)

if __name__ == '__main__':
    n = int(input())
    PrintFunction(n)

#List Comprehensions
if __name__ == '__main__':
    x = int(input())
    y = int(input())
    z = int(input())
    n = int(input())
    print ([[a,b,c] for a in range(0,x+1) for b in range(0,y+1) for c in range(0,z+1) if a + b + c != n ])