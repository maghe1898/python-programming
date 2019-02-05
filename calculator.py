num1=int(input("enter first num"))
num2=int(input("enter sec number"))
print("1.add")
print("2.sub")
print("3.mul")
print("4.divide")
choice=int(input("enter your choice:"))
if(choice==1):
    print(num1+num2)
elif(choice==2):
    print(num1-num2)
elif(choice==3):
    print(num1*num2)
elif(choice==4):
    if(num2==0):
        print("invalid")
    else:
        print(num1/num2)
else:
    print("invalid")
