
def parse_games(games)
  result = games.split(';').map do |element|
    counts = { 'red' => 0, 'green' => 0, 'blue' => 0 }
    element.scan(/(\d+) (\w+)/) { |count, color| counts[color] = count.to_i }
    counts
  end
  result
end

def lost_game?(game, winning_condition)
  return game.any? { |color, value| value > winning_condition[color] }
end

def max_values(games)
  max = { 'red' => 0, 'green' => 0, 'blue' => 0 }
  games.each do |game|
    game.each do |color, value|
      max[color] = [max[color], value].max
    end
  end
  max
end

def puzzle1(file='data/day2_sample.txt')
  sum = 0
  winning_condition = { "red" => 12, "green" => 13, "blue" => 14 }
  File.foreach(file) do |line|
    id, games = line.split(':')
    unless parse_games(games).map { |game| lost_game?(game, winning_condition) }.any?
      sum = sum + id.split(' ')[-1].to_i
    end
  end
  sum
end

def puzzle2(file='data/day2_sample.txt')
  sum = 0
  File.foreach(file) do |line|
    id, games = line.split(':')
    sum = sum + max_values(parse_games(games)).values.reduce(:*)
  end
  sum
end

puts(puzzle1('data/day2.txt'))
puts(puzzle2('data/day2.txt'))