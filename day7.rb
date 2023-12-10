


def parse_input(file_path)
  network = {}
  first_line = true
  instructions = ""

  File.foreach(file_path) do |line|
    line.strip!
    if first_line && !line.empty?
      instructions = line.chars
      first_line = false
      next
    end

    next if line.empty?

    key, values = line.split('=').map(&:strip)
    values = values.tr('()', '').split(', ').map(&:strip)
    network[key] = values
  end

  return instructions, network
end

def left_or_right(char)
  case char
  when 'L'
    0
  when 'R'
    1
  else
    nil
  end
end


instructions, network = parse_input('data/day7.txt')
p instructions
puts network

step = 'AAA'
count = 0
position = 0
while step != 'ZZZ'

  position = 0 if position == instructions.length

  step = network[step][left_or_right(instructions[position])]
  position += 1
  count += 1
end

p count
