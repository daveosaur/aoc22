inp = File.new("input.txt").read.split("\n")

results = []
100.times do |i|
  results.push( (inp[i*3].split("").to_a & inp[i*3+1].split("").to_a & inp[i*3+2].split("").to_a).join)
end

final = results.map { |i|
  if i.ord > 91
    i = (i.ord - 96)
  else
    i = (i.ord - 64 + 26)
  end
}

puts final.sum
