require_relative "6"

module SquishStrings
  refine String do
    def squish
      self.gsub(/\s+/, " ")
    end
  end
end

class Solution_6B < Solution_6
  using SquishStrings

  private

  def parse(input)
    *lines, operators_and_whitespace = input.split("\n")

    operators = operators_and_whitespace.squish.split

    (0..lines.first.length - 1).map do |i|
      lines.map { |line| line[i] }.join # build horizontal numbers
    end
    .join("\n") # make a long, cephalopod-unreadable string
    .split(" " * lines.length)
    .map { |operands| operands.squish.split }
    .each_with_index do |operands, i|
      @answers.append eval operands.join operators[i]
    end
  end
end
