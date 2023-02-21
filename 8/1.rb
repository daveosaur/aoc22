input = File.new("input.txt").read.split("\n").map {|i| i.split("").map(&:to_i)}
input = input.to_a
visible = Array.new(input[0].length) { Array.new(input.length, 0) }
#output = File.new("output.txt", "w")
  

def visible_pass(dir, inp, out)

  x = (0..98).to_a
  y = (0..98).to_a
  case dir
  when :left, :up
    y = y.reverse
  end

  for i in x do 
    print "\n"
    max = 0
    for j in y do 
      print "."
      case dir
      when :left , :right
        if inp[i][j] > max
          out[i][j] += 1
          max = inp[i][j]
        end
      when :up , :down
        if inp[j][i] > max
          out[j][i] += 1
          max = inp[j][i]
        end
      end
      if max >= 9
        break
      end
    end
  end
end

visible_pass(:right, input, visible)
visible_pass(:down, input, visible)
visible_pass(:up, input, visible)
visible_pass(:left, input, visible)

#make the outer 0s visible. whatever.
visible[0].map!{|i| i+= 1}
visible[98].map!{|i| i+=1}
visible.map{|i| 
  i[0]+=1
  i[98]+=1
}




print input.last, "\n", visible.last
total = 0
visible.each { |i|
  #output << "#{i.join}\n"
  total += i.count {|j| j>0}
}
p total
