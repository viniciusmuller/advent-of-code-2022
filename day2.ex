defmodule Aoc2022Day2 do 
  def part_one do 
    File.read!("day2.txt")
    |> String.split("\n")
    |> Stream.map(&String.split(&1, " "))
    |> Stream.filter(& &1 != [""])
    |> Stream.map(fn [c1, c2] -> {move_from_code(c1), move_from_code(c2)} end)
    |> sum_scores()
    |> IO.inspect()
  end

  def part_two do
    File.read!("day2.txt")
    |> String.split("\n")
    |> Stream.map(&String.split(&1, " "))
    |> Stream.filter(& &1 != [""])
    |> Stream.map(fn [c1, c2] -> {move_from_code(c1), calculate_move(c1, c2)} end)
    |> sum_scores()
    |> IO.inspect()
  end

  defp sum_scores(scores), do: 
    Enum.reduce(scores, 0, fn {m1, m2}, sum -> sum + calculate_score(m1, m2) end)

  defp calculate_move(opponent_code, instruction_code) do 
    opponent_move = move_from_code(opponent_code)
    instruction = instruction_from_code(instruction_code)

    case {instruction, opponent_move} do 
      {:draw, _} -> opponent_move
      {:lose, :rock} -> :scissors
      {:lose, :paper} -> :rock
      {:lose, :scissors} -> :paper
      {:win, :rock} -> :paper
      {:win, :paper} -> :scissors
      {:win, :scissors} -> :rock
    end
  end

  defp calculate_score(opponent_move, our_move) do 

    case {opponent_move, our_move} do 
      {:paper, :rock} -> 1
      {:scissors, :paper} -> 2
      {:rock, :scissors} -> 3
      {:rock, :rock} -> 4
      {:paper, :paper} -> 5
      {:scissors, :scissors} -> 6
      {:scissors, :rock} -> 7
      {:rock, :paper} -> 8
      {:paper, :scissors} -> 9
    end
  end

  defp move_from_code(code) do 
    case code do 
      c when c in ["A", "X"] -> :rock 
      c when c in ["B", "Y"] -> :paper 
      c when c in ["C", "Z"] -> :scissors
    end
  end

  defp instruction_from_code(code) do 
    case code do 
      "X" -> :lose
      "Y" -> :draw
      "Z" -> :win
    end
  end
end

Aoc2022Day2.part_two()
