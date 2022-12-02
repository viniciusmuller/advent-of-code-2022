def part_one():
    with open("day1.txt") as f:
        highest_calories = -1
        current_calories = 0

        for line in f.readlines():
            if line == '\n':
                if current_calories > highest_calories:
                    highest_calories = current_calories

                current_calories = 0
            else:
                current_calories += int(line)

        if current_calories > highest_calories:
            highest_calories = current_calories

        print(highest_calories)

def part_two():
    from collections import defaultdict

    with open("day1.txt") as f:
        elfs = defaultdict(lambda: 0)
        current_elf = 1

        for line in f.readlines():
            if line == '\n':
                current_elf += 1
            else:
                elfs[current_elf] += int(line)

        
        print(sum(sorted(elfs.values(), reverse=True)[:3]))
