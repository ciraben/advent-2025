# grab the problem set number from input args
problem_to_start = ARGV[0].match(/^([0-9]+)(b)?$/)

# expect somn like `ruby solve.rb 1b`
if not problem_to_start
  puts "idk that arg - try somn like '1b'"
  exit
end

problem, num, bee = problem_to_start.to_a

# don't restart existing problems
def existing
  (Dir.entries("solve") - [".", "..", "helpers.rb"])
  .map { |f| f.sub ".rb", "" }
end

if existing.include? problem
  puts "you already started that problem"
  exit
end

solve_rb = <<TEXT
require_relative "#{bee ? num : "helpers"}"

class Solution_#{num}#{"B < Solution_" << num if bee}
  attr_reader :placeholder

  def initialize(input)
    parse(input)
  end

  alias :solution :placeholder

  private

  def parse(input)
  end
end
TEXT

spec_rb = <<TEXT
require_relative "../solve/#{problem}"

RSpec.describe Solution_#{problem.upcase} do
  subject { Solution_#{problem.upcase}.new(input) }

  context "initially" do
    let(:input) { "" }

    it "" do
      expect(subject.another_placeholder).to be_empty
      expect(subject.placeholder).to eq 0
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "#{num}" }

    it "" do
      expect(subject.placeholder).to eq 0
    end
  end
end
TEXT

File.open("solve/#{problem}.rb", "w") do |f|
    f.write(solve_rb)
end

File.open("spec/#{problem}_spec.rb", "w") do |f|
    f.write(spec_rb)
end
