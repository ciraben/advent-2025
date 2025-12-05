require_relative "../solve/3b"

RSpec.describe Solution_3B do
  subject { Solution_3B.new(input) }

  context "a bank of values 1212121212121212121212121" do
    let(:input) { "1212121212121212121212121" }

    it "removes all the 1s, reporting joltage of 12 2s" do
      expect(subject.joltages).to contain_exactly 222222222222
      expect(subject.sum).to eq 222222222222
    end
  end

  context "a bank of thirteen equal values" do
    let(:input) { "1111111111111" }

    it "reports a joltage of 12 1s" do
      expect(subject.joltages).to contain_exactly 111111111111
      expect(subject.sum).to eq 111111111111
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "3" }

    it "reports the listed joltages and sum of 3121910778619" do
      expect(subject.joltages).to contain_exactly(
        987654321111,
        811111111119,
        434234234278,
        888911112111
      )
      expect(subject.sum).to eq 3121910778619
    end
  end
end
