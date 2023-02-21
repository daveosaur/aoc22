inp = File.new("input.txt").read

count = 0

inp.lines { |i|
  x = i.scan(/\d+/).map(&:to_i)

  if x[0] == x[2] || x[1] == x[3]
    count +=1
  elsif x[0] > x[2] && x[1] <= x[3]
    count += 1 
  elsif x[0] < x[2] && x[1] >= x[3]
    count += 1
  end
}

puts count
