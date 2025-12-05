require_relative "4"

class Solution_4B < Solution_4
  private

  def check_for_accessible_rolls
    has_changed = true

    while has_changed
      has_changed = false

      @grid.each_with_index do |row, i|
        row.each_index do |j|
          if row[j] == "@" && count_locals(i, j) < 5
            @rolls.append [i, j]
            @grid[i][j] = "x"
            has_changed = true
          end
        end
      end
    end
  end
end
