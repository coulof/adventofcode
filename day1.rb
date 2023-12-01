NUMBERS = {
  "one" =>   '1',
  "two" =>   '2',
  "three" => '3',
  "four" =>  '4',
  "five" =>  '5',
  "six" =>   '6',
  "seven" => '7',
  "eight" => '8',
  "nine" =>  '9'
}

DEBUG = true
def pd(s)
  puts s if DEBUG
end

def extract_digits(s)
  digits = s.scan(/\d/)
  pd "#{s} : #{digits} : #{digits.first} #{digits.last}"
  (digits.first + digits.last).to_i
end

def extract_digits_and_words(s)
  digits = s.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten.map { |str| NUMBERS[str] || str }
  pd "#{s} : #{digits} : #{digits.first} #{digits.last}"
  (digits.first + digits.last).to_i
end

def puzzle1(file='data/day1_sample.txt')
  sum = 0
  File.foreach(file) do |line|
    sum += extract_digits(line)
  end
  sum
end

def puzzle2(file='data/day1-2_sample.txt')
  sum = 0
  File.foreach(file) do |line|
    sum += extract_digits_and_words(line)
    pd(sum)
  end
  sum
end

# puts(puzzle1())
# puts(puzzle1('data/day1.txt'))

puts(puzzle2())
puts(puzzle2('data/day1.txt'))
