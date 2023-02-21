#input = File.new("testinput.txt").read.split("\n").reverse
input = File.new("input.txt").read.split("\n").reverse

counter = 1
breakpoint = 20
register = 1
instruction = ""
signals = []
x = 0

loop do
  if instruction == ""
    x = input.pop.scan(/\S+/)
    instruction = x[0]
  end 

  print "#{counter} - #{register} : #{x}\n"
  case instruction
  when "noop"
    instruction = ""
  when "addx"
    instruction = "addx_"
  when "addx_"
    instruction = ""
    register += x[1].to_i
  end

  counter += 1
  if counter == breakpoint
    signals.push(register * breakpoint)
    print "signal: #{signals.last}\n#{counter}:#{breakpoint}\nregister: #{register}\n"
    breakpoint += 40
    if counter >= 220
      break
    end
  end
end

print signals, signals.sum

