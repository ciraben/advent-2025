require "matrix"
require_relative "helpers"

class Solution_8
  attr_reader :points, :circuits
  attr_accessor :cables

  def initialize(input)
    @points = []
    @circuits = []
    @cables = 1000

    parse(input)
    calculate
  end

  def product
    @circuits.map { |circuit| circuit.length }
    .sort.last(3)
    .reduce(1) { |prod, length| prod * length }
  end

  def calculate
    assemble_circuits
  end

  alias :solution :product

  private

  def parse(input)
    @points = input.strip.split
    .map do |point|
      Vector[*point.split(",").map { |k| k.to_i }]
    end
  end

  def assemble_circuits
    @circuits = []

    ordered_pairs.first(@cables).each do |(pt1, pt2)|
      # no change if pt1, pt2 were already connected
      next if @circuits.select do |c|
        c.include?(pt1) && c.include?(pt2)
      end
      .any?

      # a cable connects two existing circuits or lone boxes
      @circuits << @circuits.select do |c|
        c.include?(pt1) || c.include?(pt2)
      end
      .append(pt1).append(pt2)
      .flatten.uniq

      # ditch any pre-existing circuits connected above
      @circuits.reject! do |c|
        c.include?(pt1) ^ c.include?(pt2)
      end
    end
  end

  def ordered_pairs
    @points.combination(2).to_a
    .sort_by{ |(pt1, pt2)| (pt1 - pt2).magnitude }
  end
end
