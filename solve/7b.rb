require_relative "helpers"

class Solution_7B
  attr_reader :diagram, :worlds

  def initialize(input)
    @diagram = []
    parse(input)
  end

  def worlds
    @diagram[-1].map{ |n| n.to_i }.sum
  end

  alias :solution :worlds

  private

  def parse(input)
    @diagram = input.strip.split.map do |line|
      line.chars.map { |char| char.match(/[S\|]/) ? 1 : char }
    end

    generate_cascade
  end

  def generate_cascade
    @diagram[0..-2].each_with_index do |row, i|
      row.each_with_index do |cell, j|
        next unless cell.is_a? Integer
        transmit_n_paths_to cell, [i + 1, j]
      end
    end
  end

  def transmit_n_paths_to(n, coord)
    row, col = coord

    return unless col >= 0 && col < @diagram.first.length

    if @diagram[row][col] == "^"
      transmit_n_paths_to n, [row, col - 1]
      transmit_n_paths_to n, [row, col + 1]
    else
      @diagram[row][col] = @diagram[row][col].to_i + n
    end
  end
end
