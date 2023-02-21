input = File.new("input.txt").read
#test_input = "R 4\nU 4\nL 3\nD 1\nR 4\nD 1\nL 5\nR 2"

$output = File.new("output.txt", "w")
$field = Array.new(1000) {Array.new(1000, 0)}

$display = Array.new(10) {Array.new(10, 0)}

class Knot
  attr_accessor :_x, :_y

  def initialize
    @_x = 500
    @_y = 500
  end
end

rope = Array.new(10) { Knot.new }

def clear_display
  10.times do |i|
    10.times do |j|
      $display[j][i] = 0
    end
  end
end
def print_display
  $display.each {|i|
    print "#{i}\n"
  }
end

def move(t, dir, head, tail)

  if t == 0 #first iteration, move the head only
    case dir
    when :U
      head._y -= 1
    when :D
      head._y += 1
    when :L
      head._x -= 1
    when :R
      head._x += 1
    end
  end

  if(head._y-tail._y).abs > 1 && (head._x-tail._x).abs > 1
    (head._y > tail._y) ? (tail._y += 1) : (tail._y -= 1)
    (head._x > tail._x) ? (tail._x += 1) : (tail._x -= 1)
  elsif(head._y-tail._y).abs > 1
    (head._y > tail._y) ? (tail._y += 1) : (tail._y -= 1)
    tail._x = head._x
  elsif(head._x-tail._x).abs > 1
    (head._x > tail._x) ? (tail._x += 1) : (tail._x -= 1)
    tail._y = head._y
  end

  if t == 8 #last iteration
    $field[tail._y][tail._x] = 1
  end

  #not relevant?$output << "head - #{$head}\ntail - #{$tail}\n\n"
end

input.lines do |i|
  x = i.scan(/\S+/)
  #p x
  x[1].to_i.times do
    #z = gets #debug stall
    #print_display
    #clear_display
    9.times do |t|
      move(t, x[0].to_sym, rope[t], rope[t+1])
    end
  end
end

#find the tiles
total = 0
$field.each{|i| total += i.count(1)}
p total
