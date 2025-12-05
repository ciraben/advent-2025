require_relative "2"

class Solution_2B < Solution_2
  def check(id)
    n = id.length

    (2..n/2).each do |factor|
      next unless id.length % factor == 0

      splits = id.chars.each_slice(id.length / factor).map(&:join)

      if splits.uniq.size == 1
        return count id
      end
    end

    if id.length > 1 && id.chars.uniq.size == 1
      return count id
    end
  end

  def count(id)
    @invalid_ids += 1
    @invalid_ids_list.append id
    @sum += id.to_i
  end
end
