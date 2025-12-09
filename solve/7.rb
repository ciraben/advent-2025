require_relative "helpers"

class Solution_7
  attr_reader :diagram, :splits

  def initialize(input)
    @diagram = []
    @splits = 0
    parse(input)
  end

  alias :solution :splits

  private

  def parse(input)
    @diagram = input.strip.split
    generate_cascade
  end

  def generate_cascade
    @diagram[0..-2].each_with_index do |line, i|
      line.each_char.with_index do |c, j|
        if c == "S" || c == "|"
          if @diagram[i + 1][j] == "^"
            split_beam_at i + 1, j
          else
            @diagram[i + 1][j] = "|"
          end
        end
      end
    end
  end

  def split_beam_at(row, col)
    @diagram[row][col - 1] = "|" if col > 0
    @diagram[row][col + 1] = "|" if col < @diagram.first.length - 1
    @splits += 1
  end
end
