=begin

From our visualization sidequest, we know that the shape produced
by our input is very nearly a circle, with some perimeter noise,
and with a horizontal bar removed from its equator, opening left.

I cautiously assume that any largest rectangle will reside
entirely within one hemisphere or the other. (Otherwise it would
be left-bounded by the horizontal bar, since it cannot cross it.)

Since each hemisphere is roughly convex (ignoring perimeter noise)
any large rectangle residing within it will be valid if it
contains no red tiles in its interior. It may contain other red
tiles on its perimeter, however.

Additionally, any rectangle formed by two perimeter points in one
hemisphere is height-constrained by the scale of perimeter noise.
(Otherwise it would exit the circle.) Any taller rectangle must
involve one of the two equator-defining points residing within
the circle's interior - at [94879, 50002] and [94879, 48778].

My first assumption ignores rectangles of a similar scale, so as
a second assumption, I will also ignore those rectangles that are
height-constrained by noise scale.

So, the approach:

1. take [94879, 50002]
2. iterate over points with y > 50k (~500)
3. for each, check if any third point lies within the rectangle
4. record the maximum size found
5. repeat for [94879, 48778] and the lower hemisphere

order = ~500 x ~500 x 2 ~= 500k

If we find a large rectangle (say of area scale > 10e8 = 100k x 1k)
it will be sufficient to justify our two assumptions.

UPDATE: We do!

=end

require_relative "9"

module Helper_9B
  def dx(a, b)
    (a[0] - b[0]).abs
  end

  def a_interior_to_bc?(a, b, c)
    (
      (b[0] < a[0] && a[0] < c[0]) ||
      (c[0] < a[0] && a[0] < b[0])
    ) &&
    (
      (b[1] < a[1] && a[1] < c[1]) ||
      (c[1] < a[1] && a[1] < b[1])
    )
  end
end

class Solution_9B < Solution_9
  include Helper_9B

  private

  def get_best_two
    # find our two special points
    southie, northie = @points.select.with_index do |p, i|
      dx(p, @points[i - 1]) > 9e4 ||
      dx(p, @points[(i + 1) % @points.length]) > 9e4  # allow wrap
    end
    .select { |p| p[0] > 5e4 }
    .sort_by { |p| p[1] }

    southerners, northerners = @points.partition { |p| p[1] < 5e4 }

    biggest_south = find_max_in_hemisphere southerners, southie
    biggest_north = find_max_in_hemisphere northerners, northie

    # pick the best pair
    [[biggest_south, southie], [biggest_north, northie]]
    .max_by { |(p1, p2)| area_between p1, p2 }
  end

  def find_max_in_hemisphere(perimeter_points, pivot)
    perimeter_points.reject do |corner_point|
      perimeter_points.any? do |interior_point|
        a_interior_to_bc? interior_point, corner_point, pivot
      end
    end
    .max_by { |p| area_between p, pivot }
  end
end
