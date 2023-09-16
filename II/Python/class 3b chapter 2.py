

a = float(input("Enter Amount: "))


"""
if a >= 1000:
    d = a*0.05
else:
    d = a*0.03
print("Discount is", d)
"""

''''
if a >= 5000:
    d = a*0.1
elif a  >= 4000:
    d = a*0.07
elif a >= 3000:
    d = a*0.05
elif a >= 2000:
    d = a*0.03
else:
    d = a*0.02
'''
    
    
if a >= 5000: d = a*0.1
elif a  >= 4000: d = a*0.07
elif a >= 3000: d = a*0.05
elif a >= 2000: d = a*0.03
else: d = a*0.02
    
print("Discount is", d)

a,b = 10,20
min = a if a<b else b
print(min)

