inp = File.new("input.txt").read

i = 0
loop { 
  i += 1
  if inp[i..i+13].split("").uniq.length > 13
    print "#{inp[i..i+13]} - at position #{i+14}.\n"
    break
  end
}
