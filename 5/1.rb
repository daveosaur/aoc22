#hardcode cause i'm dumb
containers = []
containers[0] = "DHNQTWVB".split ""
containers[1] = "DWB".split ""
containers[2] = "TSQWJC".split ""
containers[3] = "FJRNZTP".split ""
containers[4] = "GPVJMST".split ""
containers[5] = "BWFTN".split ""
containers[6] = "BLDQFHVN".split ""
containers[7] = "HPFR".split ""
containers[8] = "ZSMBLNPH".split ""

inp = File.new("input.txt").read

inp.lines { |i|
  x = i.scan(/\d+/).map(&:to_i)
  buff = []
  x[0].times {
    buff.unshift(containers[x[1]-1].pop)
  }
  while !buff.empty? do
      containers[x[2]-1].push(buff.pop)
  end

}

containers.each {|i|
  print i.last
}
