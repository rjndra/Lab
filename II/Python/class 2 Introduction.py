
a = [1, 5, 'ram']
print(a[2])


# Virtual Environment


''' This is also
commnet '''
x = ''' This is not
commnet '''


""" Thsi another way to
write multiple comments """

y = """ Thsi another way to
write multiple string and is not comment """


a = 5
if a % 2 == 0:
    print('Even')
else:
    print('Odd')


pi = 3.1415
pi

PI = 3.1415 # Caps are assumed to be constant understand by responsible programmer

a = b = c = 1

# list
fruits = ["apple", "banana", "Cherry"]
x,y,z = fruits

x = "Python"
y = "is"
z = "awsome"
print(x+y+z)

x = 5 # Global
def display():
    x = 7 # Local
    print(x)
display()
print(x)


# use of global keyword


x = 5 # Global
def display():
    global x
    x = 7
    print(x)
display()
print(x)

PI = 3.1415

