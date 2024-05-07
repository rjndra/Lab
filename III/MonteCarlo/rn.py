count=0
seed=1982537
while (count <100): 
    ran=(16807*seed)%(2**31-1) 
    seed =ran
    print (ran) 
    count=count+1
