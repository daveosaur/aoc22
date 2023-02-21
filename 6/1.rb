inp = File.new("input.txt").read

i = 0
loop { 
  i += 1
  if inp[i..i+3].split("").uniq.length > 3
    print "#{inp[i..i+3]} - at position #{i+4}.\n"
    break
  end
}
