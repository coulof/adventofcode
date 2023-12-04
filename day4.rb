def extract_win_and_game(line)
  card_id_part, numbers_part = line.split(':')
  card_id = card_id_part.scan(/\d+/).last.to_i
  numbers = numbers_part.split('|')

  # Extract numbers from each part using regular expression and convert them to integers
  win = numbers[0].scan(/\d+/).map(&:to_i)
  game = numbers[1].scan(/\d+/).map(&:to_i)

  return win, game, card_id
end


def puzzle1(file='data/day4_sample.txt')
  sum = 0
  File.foreach(file) do |line|
    p line
    win, game, _ = extract_win_and_game(line)
    common_numbers = win&game
    sum = sum + 2**(common_numbers.length - 1) unless common_numbers.empty?
  end
  sum
end

def puzzle2(file='data/day4_sample.txt')
  lines = []
  i = 0
  sum = 0
  File.open(file, "r") do |file|
    file.each_line do |line|
      lines << line.chomp
    end
  end

  while i < lines.length
    # p lines[i]
    win, game, card_id = extract_win_and_game(lines[i])
    number_of_copies = (win&game).length - 1
    # lines << lines[card_id..card_id + number_of_copies] unless number_of_copies == -1
    # lines.flatten!
    lines = lines + lines[card_id..card_id + number_of_copies] unless number_of_copies == -1
    i += 1
    p i
    # p number_of_copies
  end
  i
  # lines.length
end

def puzzle2_bis(file='data/day4_sample.txt')
  lines = []
  i = 0
  sum = 0
  File.open(file, "r") do |file|
    file.each_line do |line|
      lines << line.chomp
    end
  end
  cards = Hash.new(0)
  lines.each_with_index do | line, index |
    win, game, card_id = extract_win_and_game(line)
    number_of_copies = (win&game).length
    cards[card_id] += 1
    (card_id+1..card_id + number_of_copies).each do |n|
      cards[n] += cards[card_id]
    end
  end
  p cards
  cards.values.sum
end

# p puzzle1('data/day4.txt')
p puzzle2_bis('data/day4.txt')

p puzzle2('data/day4.txt')
p puzzle2
