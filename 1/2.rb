inp = File.open("input.txt", "r")

arr = [0, 0, 0]

while !inp.eof do
  temp = 0
  while (c = inp.readline) != "\n" do
    temp += c.to_i
  end

  if temp > arr[0]
    arr[2] = arr[1]
    arr[1] = arr[0]
    arr[0] = temp
  elsif temp > arr[1]
    arr[2] = arr[1]
    arr[1] = temp
  elsif temp > arr[2]
    arr[2] = temp
  end
  
end

inp.close

puts arr

puts arr[0] + arr[1] + arr[2]


