class Monkey
  attr_accessor :items
  attr_accessor :total_count

  def initialize(items, div, operation, amount)
    @items = items
    @div = div
    @op = operation
    @amt = amount
    @total_count = 0
  end

  def get_targets(tr, fl)
    @target_t = tr
    @target_f = fl
  end

  def send()
    while (x = @items.pop)

      @total_count = @total_count + 1

      case @op
      when :add
        x = x + @amt
      when :mult
        x = x * @amt
      when :square
        x = x * x
      end

      # x = x / 3

      if (x % @div == 0) and @target_t != nil
        @target_t.items.push(x)
      elsif (x % @div != 0) and @target_f != nil
        @target_f.items.push(x)
      end

    end
  end

end

#setup monkeys

monkeys = []
monkeys[0] = Monkey.new([75, 63], 11, :mult, 3)
monkeys[1] = Monkey.new([65, 79, 98, 77, 56, 54, 83, 94], 2, :add, 3)
monkeys[2] = Monkey.new([66], 5, :add, 5)
monkeys[3] = Monkey.new([51, 89, 90], 7, :mult, 19)
monkeys[4] = Monkey.new([75, 94, 66, 90, 77, 82, 61], 17, :add, 1)
monkeys[5] = Monkey.new([53, 76, 59, 92, 95], 19, :add, 2)
monkeys[6] = Monkey.new([81, 61, 75, 89, 70, 92], 3, :square, 0)
monkeys[7] = Monkey.new([81, 86, 62, 87], 13, :add, 8)

monkeys[0].get_targets(monkeys[7], monkeys[2])
monkeys[1].get_targets(monkeys[2], monkeys[0])
monkeys[2].get_targets(monkeys[7], monkeys[5])
monkeys[3].get_targets(monkeys[6], monkeys[4])
monkeys[4].get_targets(monkeys[6], monkeys[1])
monkeys[5].get_targets(monkeys[4], monkeys[3])
monkeys[6].get_targets(monkeys[0], monkeys[1])
monkeys[7].get_targets(monkeys[3], monkeys[5])

#now do logic:

for i in 1..10000 do
  puts i
  monkeys.each { |j|
    j.send
  }
end

monkeys.each { |i|
  puts i.total_count
}
