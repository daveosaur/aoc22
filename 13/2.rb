require 'json'

class Integer
  def length
    1
  end
end

#input = File.new("test.txt").read.split("\n").reject(&:empty?).map{|i| JSON.parse(i)}
input = File.new("input.txt").read.split("\n").reject(&:empty?).map{|i| JSON.parse(i)}

def compare(x, y)
  #returns true/false, nil for same
  a = x.clone
  b = y.clone

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

def sorty(a, b)
  compare(b, a) ? 1 : -1
end

a = [[2]]
b = [[6]]

sorted = input.push(a).push(b).sort {|a, b| sorty(a, b)}

sorted.each.with_index {|i, index|
  print "#{index} - #{i}\n"
}

p (sorted.index(a) + 1) * (sorted.index(b) + 1)
