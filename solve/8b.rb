require_relative "8"

class Solution_8B < Solution_8
  attr_reader :last_two

  def product
    @last_two.map { |v| v[0] }
    .reduce(1) { |prod, x| prod * x }
  end

  alias :solution :product

  private

  def assemble_circuits
    @circuits = @points.map { |p| [p] }

    ordered_pairs.each do |(pt1, pt2)|
      # no change if pt1, pt2 were already connected
      next if @circuits.select do |c|
        c.include?(pt1) && c.include?(pt2)
      end
      .any?

      # a cable connects two existing circuits or lone boxes
      @circuits << @circuits.select do |c|
        c.include?(pt1) || c.include?(pt2)
      end
      .flatten

      # ditch any pre-existing circuits connected above
      @circuits.reject! do |c|
        c.include?(pt1) ^ c.include?(pt2)
      end

      # if it's one big circuit now, we're done!
      if @circuits.length == 1
        @last_two = [pt1, pt2]
        return
      end
    end
  end
end
