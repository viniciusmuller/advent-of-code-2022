defmodule Aoc2022Day1 do 
  def part_one do 
    File.read!("day1.txt")
    |> String.split("\n")
    |> Enum.reduce({0, 1, 0}, fn line, {calories, elf_position, highest_calories} -> 
      cond do 
        line == "" and calories > highest_calories ->
          {0, elf_position + 1, calories}
        line == "" ->
          {0, elf_position + 1, highest_calories}
        true ->
          {num, _} = Integer.parse(line)
          {calories + num, elf_position, highest_calories}
      end
    end)
    |> elem(2)
    |> IO.inspect()
  end

  def part_two do 
    File.read!("day1.txt")
    |> String.split("\n")
    |> Enum.reduce({%{}, 1}, fn line, {data, elf_position} -> 
      if line == "" do
          {data, elf_position + 1}
      else
          {num, _} = Integer.parse(line)
          calories = Map.get(data, elf_position, 0)
          {Map.put(data, elf_position, calories + num), elf_position}
      end
    end)
    |> elem(0)
    |> Map.values()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
    |> IO.inspect()
  end
end

Aoc2022Day1.part_two()
