require 'json'
require 'pry-byebug'

#input = File.new("test.txt").read.split("\n")
input = File.new("input.txt").read.split("\n").reject(&:empty?)

def compare(a, b)
  #returns true/false, nil for same

  if a.nil? || b.nil?
    a.nil? ? (return false) : (return true)
  end
  len = [a.length, b.length].max

  (0..len).each do |i|
    if a[i].nil? || b[i].nil?
      a[i].nil? ? (return true) : (return false)
    end

    if a[i].class != b[i].class
      a[i].class == Array ? (b[i] = [b[i]]) : (a[i] = [a[i]])
      z = compare(a[i], b[i])
      z.nil? ? next : (return z)
    elsif a[i].class == Array
      (z = compare(a[i], b[i])).nil? ? next : (return z)
    else
      a[i] == b[i] ? next : 0
      a[i] > b[i] ? (return false) : (return true)
    end
  end

  return nil

end

z = []
correct = 0
input.each.with_index do |i, index|
  z.push(JSON.parse(i))
  if (index+1) % 2 == 0 
    p z[index-1], z[index]
    compare(z[index-1], z[index]) ? (correct += ((index+1)/2)) : 0
    p correct
    next
  end
end
