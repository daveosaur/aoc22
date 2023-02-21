inp = File.new("input.txt").read

count = 1000

inp.lines { |i|
  x = i.scan(/\d+/).map(&:to_i)

  if x[0] > x[3] || x[1] < x[2] 
    count -= 1
  end
}

puts count
