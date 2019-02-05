year =int(input("enter the year:"))
if (year % 4) == 0:
   if (year % 100) == 0:
       if (year % 400) == 0:
           print("{0} yes ".format(year))
       else:
           print("{0} no".format(year))
   else:
       print("yes")
else:
   print("no")
