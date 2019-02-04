num = int(input("Enter any number: "))
flag = num%2
if flag == 0:
    print(num, "the num is an even number")
elif flag == 1:
    print(num, "the num is an odd number")
else:
    print("Invalid input")
