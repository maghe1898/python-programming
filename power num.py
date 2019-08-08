number=int(input('enter the value:'))
exponent=int(input('enter the value:'))
power=1
for i in range(1,exponent+1):
  power= power * number
  print("the res of {} power {} ={}".format(number,exponent,power))
