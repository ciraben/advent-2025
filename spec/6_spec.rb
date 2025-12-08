require_relative "../solve/6"

RSpec.describe Solution_6 do
  subject { Solution_6.new(input) }

  context "a column sum" do
    let(:input) { "1\n2\n4\n+" }

    it "reports the answer 7 (and sum 7)" do
      expect(subject.answers).to contain_exactly 7
      expect(subject.sum).to eq 7
    end
  end

  context "a column product" do
    let(:input) { "1\n2\n4\n*" }

    it "reports the answer 8 (and sum 8)" do
      expect(subject.answers).to contain_exactly 8
      expect(subject.sum).to eq 8
    end
  end

  context "a column product and column sum side by side" do
    let(:input) { "1   5\n2  10\n4 3\n*  + " }

    it "reports the answers 8 and 18, summing to 26" do
      expect(subject.answers).to contain_exactly 8, 18
      expect(subject.sum).to eq 26
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "6" }

    it "reports four totals (33210, 490, 4243455, 401) with sum 4277556" do
      expect(subject.answers).to contain_exactly 33210, 490, 4243455, 401
      expect(subject.sum).to eq 4277556
    end
  end
end
