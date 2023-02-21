input = File.new("input.txt").read.split("\n").map {|i| i.split("").map(&:to_i)}

def check(x, y, inp)
  origin = x, y
  height = inp[x][y]
  a = b = c = d = 0
  loop do
    x -= 1
    break if x < 0 
    a += 1
    break if inp[x][y] >= height
  end
  x, y = origin
  loop do
    x += 1
    break if x > 98
    b += 1
    break if inp[x][y] >= height
  end
  x, y = origin
  loop do
    y -= 1
    break if y < 0 
    c += 1
    break if inp[x][y] >= height
  end
  x, y = origin
  loop do
    y += 1
    break if y > 98
    d += 1
    break if inp[x][y] >= height
  end

  return (a * b * c * d)
end

max = 0

input.each_index {|i|
  input[i].each_index{|j|
    max = [check(i, j, input), max].max
  }
}


p max


