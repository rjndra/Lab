a = int(input("Enter a: "))
b = int(input("Enter b:"))
op = input("Enter and operator:")

match op:
    case "+":
        print(a+b)
    case "-":
        print(a-b)
    case "*":
        print(a*b)
    case "/":
        print(a/b)
    case _:
        print("Wrong Operator", op)