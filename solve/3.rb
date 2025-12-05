require_relative "helpers"

class Solution
  attr_reader :joltages, :sum

  def initialize(input)
    @joltages = []
    parse(input)
  end

  def sum
    @joltages.sum
  end

  alias :solution :sum

  private

  def parse(input)
    input.strip.split.each do |bank|
      parse_bank bank
    end
  end

  def parse_bank(input)
    ("1".."9").reverse_each do |battery_1|
      ("1".."9").reverse_each do |battery_2|
        if input.match /#{battery_1}.*#{battery_2}/
          @joltages.append (battery_1 << battery_2).to_i
          return
        end
      end
    end
  end
end
