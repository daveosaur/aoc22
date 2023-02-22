#fix the last column at some point lol.
#input = File.new("testinput.txt").read.split("\n").reverse
input = File.new("input.txt").read.split("\n").reverse

counter = 1
register = 1
instruction = ""
inp = 0
breakpoint = 40

display = Array.new(6) { Array.new(40, 0) }
vert = 0

loop do
  if instruction == ""
    inp = input.pop.scan(/\S+/)
    instruction = inp[0]
  end 

  if ((counter-1) % 40 >= (register - 1)) && ((counter - 1) % 40 <= (register + 1))
    puts "drawing pixel at #{vert},#{counter - 1}"
    display[vert][counter % 40 - 1] = 1
  end

  print "#{counter} - #{register} : #{inp}\n"
  case instruction
  when "noop"
    instruction = ""
  when "addx"
    instruction = "addx_"
  when "addx_"
    instruction = ""
    register += inp[1].to_i
  end


  counter += 1
  if counter > 240
    break
  end

  if counter == breakpoint
    breakpoint += 40
    vert += 1
  end
end

display.each {|i|
  i.each {|j|
    j == 1 ? (print "#") : (print ".")
  }
  print "\n"
}
