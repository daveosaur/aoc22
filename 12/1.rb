#require 'pry-byebug'

out = File.new("output.txt", "w")

class Node
  attr_accessor :_x, :_y, :fcost, :height, :gcost, :parent
  #debug order display
  attr_accessor :order

  def initialize(x, y, height)
    @_x = x
    @_y = y
    @height = height
  end

  def calc
    x = ($target._x - @_x).abs
    y = ($target._y - @_y).abs
    @gcost = @parent.gcost + 1
    @hcost = x*x + y*y
    @fcost = @gcost + @hcost
  end
end

#initialize things
input = File.new("input.txt").read.split("\n").map { |i| i.split "" }
#input = File.new("testinput.txt").read.split("\n").map { |i| i.split "" }
$inp = Array.new(input.length) { Array.new(input[0].length)}
input.each_with_index do |arr, i|
  arr.each_with_index do |element, j|
    case element
    when "S"
      $inp[i][j] = Node.new(j, i, element.ord)
      $start = $inp[i][j]
    when "E"
      $inp[i][j] = Node.new(j, i, element.ord)
      $target = $inp[i][j]
    else
      $inp[i][j] = Node.new(j, i, element.ord)
    end
    #print $inp[i][j].height.chr
  end
  #print " #{i}"
  #gets
end

$start.parent = :start
$start.height = 96
$start.gcost = 0

$target.height = "z".ord + 1
$length = $inp[0].length - 1
$height = $inp.length - 1

open = [$start]
closed = []

#help
#loop
order = 0
loop do
  order += 1
  open.sort_by!(&:fcost).reverse
=begin
  open.each {|i|
    print "#{i.fcost} "
  }
=end
  cur = open.shift
  cur.order = order
  closed.push cur
  p cur.height.chr

  if order == 8
    #binding.pry
  end
  if cur == $target
    break
  end


  [[cur._x - 1, cur._y], [cur._x + 1, cur._y], [cur._x, cur._y - 1], [cur._x, cur._y + 1]].each do |j, i|
    print "--- x: #{j} / y: #{i}\n"
    if j<0 || j > $length || i < 0 || i > $height
      next
    end
    this = $inp[i][j]
    if this.height > (cur.height + 1) || closed.include?(this)
      next
    end
    if !open.include? this
      open.push this
      this.parent = cur
      this.calc
    else
      if (cur.gcost + 1) < this.gcost
        this.parent = cur
        this.calc
      end
    end

    #p this

  end
end

print "#{$target.gcost} - distance\n"

$inp.each do |i|
  i.each do |j|
    #real input debug display
    #(j.gcost == nil) ? (out << "nil") : (out << "%03d" % [j.gcost])
    #test input display
    (j.gcost == nil) ? (out << "nil") : (out << "%03d" % [j.gcost])
    #order display
    #(j.order == nil) ? (out << "ZZZ") : (out << "%03d" % [j.order])

  end
  out << "\n"
end
