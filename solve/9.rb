require_relative "helpers"

class Solution_9
  attr_reader :best_two

  def initialize(input)
    @points = []
    parse(input)
    @best_two = get_best_two
  end

  def max_area
    area_between *@best_two
  end

  alias :solution :max_area

  private

  def parse(input)
    @points = input.strip.split.map do |line|
      line.split(",").map { |val| val.to_i }
    end
  end

  def get_best_two
    @points.combination(2).to_a.sort_by do |(pt1, pt2)|
      area_between pt1, pt2
    end
    .last
  end

  def area_between a, b
    ((a[1] - b[1]).abs + 1) * ((a[0] - b[0]).abs + 1)
  end
end
