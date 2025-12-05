require_relative "helpers"

class Solution_4
  attr_reader :num_accessible, :rolls

  def initialize(input)
    @rolls = []
    parse(input)
  end

  def num_accessible
    @rolls.length
  end

  alias :solution :num_accessible

  private

  def parse(input)
    @grid = input.strip.split.map { |row| row.chars }

    check_for_accessible_rolls
  end

  def check_for_accessible_rolls
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        if row[j] == "@" && count_locals(i, j) < 5
          @rolls.append [i, j]
        end
      end
    end
  end

  def count_locals(a, b)
    locals = ""

    (a-1..a+1).each do |i|
      (b-1..b+1).each do |j|
        next if i < 0 || j < 0
        locals << @grid.fetch(i, [""]).fetch(j, "")
      end
    end

    locals.count "@"
  end
end
