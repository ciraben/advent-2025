require_relative "helpers"

class Solution_5
  attr_reader :fresh_ranges, :fresh_ids, :count

  def initialize(input)
    @fresh_ranges = []
    @fresh_ids = []
    parse(input)
  end

  def count
    @fresh_ids.length
  end

  alias :solution :count

  private

  def parse(input)
    first_chunk, next_chunk = input.split "\n\n"

    @fresh_ranges = first_chunk.strip.split.map do |r|
      r.split("-")
      .map { |s| s.to_i }
    end
    .sort_by { |r| r.first }

    ids = next_chunk.strip.split.map { |id| id.to_i }.sort

    bookmark = 0
    ids.each do |id|
      fresh_ranges[bookmark..].each do |range|
        if id < range.first
          break
        elsif id <= range.last
          @fresh_ids.append id
          break
        else
          bookmark += 1
        end
      end
    end
  end
end
