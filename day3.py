def separate_rucksacks(input):
    mid = len(input) // 2
    return (input[:mid], input[mid:])

def get_priority(char):
    value = 0

    if char.isupper():
        value = ord(char) - 38
    else:
        value = ord(char) - 96

    return value

def part_one():
    with open("day3.txt") as f:
        content = filter(lambda x: x != "", f.read().split("\n"))

        sum = 0

        for line in content:
            (left, right) = separate_rucksacks(line)
            left_set = set(left)
            right_set = set(right)
            repeated_char = next(iter(left_set & right_set))
            sum += get_priority(repeated_char)

        print(sum)


def part_two():
    group = lambda t, n: zip(*[t[i::n] for i in range(n)])

    with open("day3.txt") as f:
        content = group(filter(lambda x: x != "", f.read().split("\n")), 3)
        sum = 0

        for (a, b, c) in content:
            repeated_char = next(iter(set(a) & set(b) & set(c)))
            sum += get_priority(repeated_char)

        print(sum)

part_two()
