input = File.new("input.txt").read
$output = File.new("output.txt", "w")
field = Array.new(1000) {Array.new(1000, 0)}

$head = [500, 500]
$tail = [500, 500]


def move(dir, f)
  case dir
  when :U
    $head[1] -= 1
  when :D
    $head[1] += 1
  when :L
    $head[0] -= 1
  when :R
    $head[0] += 1
  end

  #case dir
  #when :U, :D
    if($head[1]-$tail[1]).abs > 1
      ($head[1] > $tail[1]) ? ($tail[1] += 1) : ($tail[1] -= 1)
      $tail[0] = $head[0]
    end
  #when :L, :R
    if($head[0]-$tail[0]).abs > 1
      ($head[0] > $tail[0]) ? ($tail[0] += 1) : ($tail[0] -= 1)
      $tail[1] = $head[1]
    end
  #end

  f[$tail[1]][$tail[0]] = 1

  print "head - #{$head}\ntail - #{$tail}\n\n"
  $output << "head - #{$head}\ntail - #{$tail}\n\n"

end

print "start:\nhead - #{$head}\ntail - #{$tail}\n--\n"

input.lines {|i|
  x = i.scan(/\S+/)
  p x
  x[1].to_i.times do
    move(x[0].to_sym, field)
  end
}

=begin
move(:R, field)
move(:R, field)
move(:R, field)
move(:R, field)
move(:L, field)
move(:L, field)
move(:L, field)
move(:L, field)

field.each {|i|
  print "#{i}\n"
}
=end
p $head
p $tail




#find the tiles
total = 0
field.each{|i| total += i.count(1)}
p total
