require_relative "3"

class Solution_3B < Solution_3
  private
  
  def parse_bank(input)
    digits = input.chars

    while digits.length > 12
      digits.each_index do |i|
        if i == digits.length - 1
          append digits
          return
        else
          if digits[i] < digits[i + 1]
            digits.delete_at i
            break
          end
        end
      end
    end

    append digits
  end

  def append(digits)
    @joltages.append digits[0,12].join.to_i
  end
end
