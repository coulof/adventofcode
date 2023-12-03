DEBUG = true
def pd(s)
  puts s if DEBUG
end

def check_adjacent_characters_with_corners(input_data, line_index, column_range)
  line = input_data[line_index]
  start_index, end_index = column_range
  adjacent_characters = {}

  # Check left and right characters
  adjacent_characters[:left] = start_index > 0 ? line[start_index - 1] : nil
  adjacent_characters[:right] = end_index < line.length - 1 ? line[end_index + 1] : nil

  # Check top and bottom characters
  if line_index > 0
    top_line = input_data[line_index - 1]
    adjacent_characters[:top] = top_line[start_index..end_index]
    adjacent_characters[:top_left] = start_index > 0 ? top_line[start_index - 1] : nil
    adjacent_characters[:top_right] = end_index < line.length - 1 ? top_line[end_index + 1] : nil
  end

  if line_index < input_data.length - 1
    bottom_line = input_data[line_index + 1]
    adjacent_characters[:bottom] = bottom_line[start_index..end_index]
    adjacent_characters[:bottom_left] = start_index > 0 ? bottom_line[start_index - 1] : nil
    adjacent_characters[:bottom_right] = end_index < line.length - 1 ? bottom_line[end_index + 1] : nil
  end
  adjacent_characters
end

def touch_only_char?(adjacent_characters, pattern=/^\.*$/)
  adjacent_characters.values.all? { |v| v.nil? || v.match?(pattern) }
end

def puzzle1(file)
    lines = []
    sum = 0
    File.open(file, "r") do |file|
      file.each_line do |line|
        lines << line.chomp
      end
    end
    pd lines
    lines.each_with_index do |line, line_id|
      numbers = line.scan(/\d+/)
      numbers.each do |number|
        pd sum
        idx = [line.index(number), line.index(number) + number.length - 1]
        pd "Line ID: #{line_id}, Number: #{number}, Index: #{idx}"
        adjacent_characters = check_adjacent_characters_with_corners(lines, line_id, idx)
        pd "#{adjacent_characters} ; #{touch_only_char?(adjacent_characters)}"
        sum = sum + number.to_i unless touch_only_char?(adjacent_characters)
      end
    end
    sum
end

puts(puzzle1('data/day3.txt'))