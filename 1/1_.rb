input = File.open("input.txt", "r")
inp = input.read

max = 0

temp = 0

inp.lines.each {|a|
  puts("current max: #{max}, current temp: #{temp}, current item: #{a}")
  if a == "\n" or a == "" then
    if temp > max then
      max = temp
      temp = 0
    end
    next
  end
  temp += a.to_i
}







input.close

puts max


