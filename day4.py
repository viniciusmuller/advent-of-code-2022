

def part_one():
    with open("day4.txt") as f:
        content = filter(lambda x: x != "", f.read().split("\n"))
        result = 0

        for line in content:
            r1, r2 = line.split(",")

            n1, n2 = r1.split("-")
            n3, n4 = r2.split("-")

            if (int(n1) <= int(n3) and int(n2) >= int(n4)) or (int(n3) <= int(n1) and int(n4) >= int(n2)): 
                result += 1


        print(result)

def part_two():
    with open("day4.txt") as f:
        content = filter(lambda x: x != "", f.read().split("\n"))
        overlapping = 0

        for line in content:
            r1, r2 = line.split(",")

            n1, n2 = r1.split("-")
            n3, n4 = r2.split("-")

            a = set(range(int(n1), int(n2) + 1))
            b = set(range(int(n3), int(n4) + 1))

            if len(a & b) > 0:
                overlapping += 1
                print([n1, n2], [n3, n4], "overlap")
            else:
                print([n1, n2], [n3, n4], "no overlap")


        print(overlapping)

part_two()
