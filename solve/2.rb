require_relative "helpers"

class Solution
  attr_reader :invalid_ids, :sum
  alias :solution :sum

  def initialize(input)
    @invalid_ids = 0
    @sum = 0
    parse(input)
  end

  private

  def parse(input)
    input.split(",").each { |range| parse_range range }
  end

  def parse_range(range)
    start, stop = range.strip.split("-")
    (start..stop).each do |id|
      check id
    end
  end

  def check(id)
    return unless id.length.even?

    half, _half = id.chars.each_slice(id.length / 2).map(&:join)

    if half == _half
      @invalid_ids += 1
      @sum += id.to_i
    end
  end
end
