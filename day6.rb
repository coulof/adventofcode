input = <<~DATA
Time:        44     82     69     81
Distance:   202   1076   1138   1458
DATA

lines = input.split("\n")

time_line = lines[0]
distance_line = lines[1]

time = time_line.split[1..-1].map(&:to_i)
distance = distance_line.split[1..-1].map(&:to_i)


def hold_time(n)
  distance = [0]
  (0..n).each do |hold|
    distance << hold * (n - hold)
  end
  return distance
end

def puzzle1(time, distance)
  record = 1
  time.each_with_index do |time_value, index|
    record = record * hold_time(time_value).select { |element| element > distance[index] }.length
  end
  record
end

def puzzle2(time, distance)
  hold_time(time).select { |element| element > distance }.length
end
puts puzzle1(time, distance)

time2 = time.join.to_i
distance2 = distance.join.to_i

puts puzzle2(time2, distance2)
