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