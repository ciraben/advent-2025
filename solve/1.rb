require_relative "helpers"

class Solution
  attr_reader :dial, :password
  alias :solution :password

  def initialize(input)
    @dial = 50
    @password = 0

    parse(input)
  end

  private

  def parse(input)
    input.split.each do |step|
      move step.sub(/L/, "-").sub(/R/, "").to_i

      if @dial == 0
        @password += 1
      end
    end
  end

  def move(num)
    @dial += num
    @dial %= 100
  end
end
