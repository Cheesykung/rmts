def main():
    ty = str(input("Type: "))
    start = int(input("Start: "))
    end = int(input("End: "))
    codename = str(input("Codename: "))
    code = int(input("CodeStart: "))

    # if (ty == "-"):
    #     for i in range(start, end-1, -1):
    #         print("(null, null, %d, %d, %d, null, null),"%(i+1, i, i-1))

    # else:
    #     for i in range(start, end+1):
    #         print("(null, null, %d, %d, %d, null, null),"%(i-1, i, i+1))

    # if (ty == "-"):
    #     for i in range(start, end-1, -1):
    #         print("(%d, %d, \"%s%d\"),"%(i, 0, codename, code))
    #         code += 1

    # else:
    #     for i in range(start, end+1):
    #         print("(%d, %d, \"%s%d\"),"%(i, 0, codename, code))
    #         code += 1

main()