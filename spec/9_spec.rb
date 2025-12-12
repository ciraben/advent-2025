require_relative "../solve/9"

RSpec.describe Solution_9 do
  subject { Solution_9.new(input) }

  context "a simple input" do
    let(:input) { "1,1\n2,3" }

    it "reports (1,1) and (2,3) as the best pair, covering 6 tiles" do
      expect(subject.best_two).to contain_exactly(
        [1,1],
        [2,3]
      )
      expect(subject.max_area).to eq 6
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "9" }

    it "reports (2,5) and (11,1) as the best pair, covering 50 tiles" do
      expect(subject.best_two).to contain_exactly(
        [2,5],
        [11,1]
      )
      expect(subject.max_area).to eq 50
    end
  end
end
