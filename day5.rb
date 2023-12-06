def parse_input(file)
  maps = {}
  current_key = ''

  file.each_line do |line|
    p line
    if line =~ /seeds: /
      maps['seeds'] = line.split(':').last.split.map(&:to_i)
    elsif line.strip.end_with? 'map:'
      current_key = line.strip[0...-1]
      maps[current_key] = []
    elsif line.strip != ''
      maps[current_key] << line.split.map(&:to_i)
    end
  end
  maps
end

def source_to_destination(maps)
  key = maps.keys.first

  words = key.split('-') # ["seed", "to", "soil map"]
  seed = words.first     # "seed"
  soil = words[2].split(' ').first # "soil"
  max_value = maps.values.flatten.max
  source = Array.new(max_value) { |index| index }
  destina
end
input = File.read('data/day5_sample.txt')

result = parse_input(input)
puts result
