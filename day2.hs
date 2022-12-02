import Data.Text (splitAt)

score ('B', 'X') = 1
score ('C', 'Y') = 2
score ('A', 'Z') = 3
score ('A', 'X') = 4
score ('B', 'Y') = 5
score ('C', 'Z') = 6
score ('C', 'X') = 7
score ('A', 'Y') = 8
score ('B', 'Z') = 9
score _ = 0

cheat ('B', 'X') = 1
cheat ('C', 'X') = 2
cheat ('A', 'X') = 3
cheat ('A', 'Y') = 4
cheat ('B', 'Y') = 5
cheat ('C', 'Y') = 6
cheat ('C', 'Z') = 7
cheat ('A', 'Z') = 8
cheat ('B', 'Z') = 9
cheat _ = 0

-- TODO: use stdlib to split
split :: String -> (Char, Char)
split (h:_:t:_) = (h, t)
split _ = undefined

partOne = do
  input <- readFile "day2.txt"
  print $ sum . map (score . split) $ lines input

partTwo = do
  input <- readFile "day2.txt"
  print $ sum . map (cheat . split) $ lines input

main = partTwo
