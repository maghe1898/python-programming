num = int(input("Enter any number: "))
flag = num%2
if flag == 0:
    print(num, "even number")
elif flag == 1:
    print(num, "odd number")
else:
    print("Invalid input")
