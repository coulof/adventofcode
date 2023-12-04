def extract_win_and_game(line)
  numbers = line.split(':').last.split('|')
  # Extract numbers from each part using regular expression and convert them to integers
  win = numbers[0].scan(/\d+/).map(&:to_i)
  game = numbers[1].scan(/\d+/).map(&:to_i)
  return win, game
end


def puzzle1(file='data/day4_sample.txt')
  sum = 0
  File.foreach(file) do |line|
    p line
    win, game = extract_win_and_game(line)
    common_numbers = win&game
    sum = sum + 2**(common_numbers.length - 1) unless common_numbers.empty?
  end
  sum
end

p puzzle1('data/day4.txt')
