class Node
  def initialize(name, size)
    @name = name
    @size = size
    @children = {}
  end

  def insert(name, size)
    @children[name] = Node.new(name, size)
  end

  def child(name)
    return @children[name]
  end
  
  def name
    return @name
  end
  def size
    return @size
  end

  def children
    @children.each_key { |i| yield i }
  end

end

def print_tree(thing, depth)

  depth.times do
    print "  "
  end
  print "#{thing.name} - #{thing.size}"
  if thing.size == :dir
    n = dir_size(thing)
    #i forgot to seperate out part 2. this is part 2's answer, not gonna go reimplement p1.
    if n >= 4376732
      $folders.push n
    end
    print " - #{n}\n"
  else 
    print "\n"
  end

  thing.children {|i|
    print_tree(thing.child(i), depth+1)
  }
end

def dir_size(thing)
  size = 0

  thing.children { |i|
    if thing.child(i).size == :dir
      size += dir_size(thing.child(i))
    else
      size += thing.child(i).size
    end
  }
  return size
end

#set up variables for to run the thingy
pwd = []
root = Node.new("root", :root)
current = root

inp = File.new("input.txt").read

$folders = []


inp.lines do |i|
  x = i.scan(/\S+/)

  print "#{pwd}"
  print "#{current}\n"

  case x[0]
  when "$"
    case x[1]
    when "cd"
      case x[2]
      when ".."
        pwd.pop
        current = root
        pwd.each { |i|
          current = current.child(i)
        }
      else
        pwd.push x[2]
        if current.child(pwd.last).nil?
          current.insert(pwd.last, :dir)
        end
        current = current.child(pwd.last)

      end
    when "ls"
      next
    end
  when "dir"
    if current.child(pwd.last).nil?
      current.insert(x[1], :dir)
    end

  else
    current.insert(x[1], x[0].to_i)
  end
end

print_tree(root, 0)

puts $folders.sort
