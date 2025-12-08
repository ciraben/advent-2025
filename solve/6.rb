require_relative "helpers"

class Solution_6
  attr_reader :answers, :sum

  def initialize(input)
    @answers = []
    parse(input)
  end

  def sum
    @answers.sum
  end

  alias :solution :sum

  private

  def parse(input)
    equation_bits = input.split("\n")
    .map { |line| line.gsub(/\s+/, " ").split }

    equation_bits.last.each_with_index do |operator, i|
      equation = equation_bits[0..-2].map { |col| col[i] }
      @answers.append eval equation.join operator
    end
  end
end
