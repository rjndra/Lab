import random

f = open("rand.dat", "w")
count = 0
while (count < 100) :
    print(random.random(),
           random.random(),
           file=f)
    # f.write("{ } { }\n".format(random.random(), random.random())) 
    count = count + 1
f.close()
