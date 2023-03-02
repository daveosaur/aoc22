class Sand

  def initialize
    @_x = 500
    @_y = 0
    @moving = true
    if $field[@_y][@_x] == "S" #part 2 check, ends the simulation if sand fills to the top
      $end = true
    end
  end

  def move
    if @_y >= $field.length - 1 #check for bottom void
      $end = true
      return false
    end
    [0, -1, 1].each do |i|
      if $field[(@_y + 1)][(@_x + i)] == 0
        @_y += 1
        @_x += i
        return true
      end
    end
    $field[@_y][@_x] = "S"
    @moving = false
    return false
  end
end

def debug_print(output)
  $field.each do |i|
    i.each do |j|
      output << j
    end
    output << "\n"
  end
end

def draw_field(inp)
  inp.each do |l|
    wall = l.scan(/\d+,\d+/).map{|i| i.split(",").map(&:to_i)}
    wall.each_cons(2) do |pair|
      p pair
      if pair[0][0] == pair[1][0] #y is the same
        p "drawing vertical"
        start = [pair[0][1], pair[1][1]].min
        finish = [pair[0][1], pair[1][1]].max
        (start..finish).each do |i|
          $field[i][(pair[0][0])] = 1
        end
      else                        #x is the same
        p "drawing horizontal"
        start = [pair[0][0], pair[1][0]].min
        finish = [pair[0][0], pair[1][0]].max
        (start..finish).each do |i|
          $field[(pair[0][1])][i] = 1
        end
      end
    end
  end
  #hardcoded floor. sue me
  $field[174] = $field[174].map {1}
  p "done drawing"
end

input = File.new("input.txt").read.split("\n")
#input = File.new("test.txt").read.split("\n")
output = File.new("out.txt", "w")
#set size according to input
fieldx = 1000
fieldy = 175

$end = false
$field = Array.new(fieldy) { Array.new(fieldx, 0) }

draw_field(input)
$field[0][500] = "+"

current = Sand.new
counter = 0
loop do #main loop
  if $end
    break
  elsif !current.move
    current = Sand.new
    counter += 1
    p counter
    if counter > 1000000
      debug_print(output)
      break
    end
  end
end

debug_print(output)
print "#{counter - 1} units of sand settled.\n"
