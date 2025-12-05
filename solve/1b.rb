require_relative "1"

class Solution_1B < Solution_1
  private

  def parse(input)
    input.split.each do |step|
      step = step.sub(/L/, "-").sub(/R/, "").to_i

      if step > 0
        @password += (@dial + step.abs) / 100
      else
        if @dial == 0
          @dial = 100
        end

        @password += (100 - (@dial - step.abs)) / 100
      end

      @dial += step
      @dial %= 100
    end
  end
end
