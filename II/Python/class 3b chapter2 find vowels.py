str = "Rajendra"
count = 0

for x in str:
    if x in {'a', 'e', 'i', 'o', 'u'}:
        count = count + 1
print(count)