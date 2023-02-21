start = Time.now().nsec()
inp = File.open("input.txt", "r")

max = 0

while !inp.eof do
  temp = 0

  while (c = inp.readline) != "\n" do
    temp += c.to_i
  end

  if temp > max
    max = temp
  end
  
end

inp.close

puts max
puts Time.now().nsec - start

