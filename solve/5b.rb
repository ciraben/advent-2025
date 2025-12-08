require_relative "5"

class Solution_5B < Solution_5

  def count
    @fresh_ranges.map{ |r| r.last - r.first + 1 }
    .sum
  end

  alias :solution :count

  private

  def record_fresh_ids

    skip = 0
    @fresh_ranges.each_with_index do |range, i|
      next if i == 0

      # look back to most recent non-nil range
      previous = @fresh_ranges[i - 1 - skip]

      # if range overlaps, combine with previous
      if range.first <= previous.last
        previous[-1] = [range.last, previous.last].max
        @fresh_ranges[i] = nil
        skip += 1
      else
        skip = 0
      end
    end

    @fresh_ranges.compact!
  end
end
