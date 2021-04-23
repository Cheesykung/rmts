def main():
    start = int(input("Start: "))
    end = int(input("End: "))
    for i in range(start, end, -1):
        print("(%d, %d, %d),"%(i+1, i, i-1))

    # for i in range(start, end+1):
    #     print("(%d, %d, %d),"%(i-1, i, i+1))

main()