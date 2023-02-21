inp = File.new("input.txt").read
folders = {}
pwd = []
out = File.new("debug.txt", "w")

def get_size(target, dir)
  size = 0

  dir[target].each{ |t|
    if t.class == Array
      size += t[1]
    else
    end
    print "#{t}\n"

  }
  return size
end

inp.lines do |i|
  x = i.scan(/\S+/)
  case x[0]
  when "$"
    case x[1]
    when "cd"
      case x[2]
      when ".."
        pwd.pop
        next
      else
        pwd.push x[2]
        if folders[pwd].nil?
          folders[pwd] = []
        end
      end
    when "ls"
      next
    end
  when "dir"
    folders[pwd].push x[1]
  else
    folders[pwd].push [x[1], x[0].to_i]
  end
end

puts "folders"

folders.each_key {|i|
  print i
  puts ""
}

puts "-test-"

#puts get_size("/", folders)
