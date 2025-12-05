require_relative "../solve/4b"

RSpec.describe Solution_4B do
  subject { Solution_4B.new(input) }

  context "a simple roll diagram" do
    let(:input) {
      "@@@\n"<<
      "@.@\n"<<
      "@@@\n"
    }

    it "reports 8 accessible rolls" do
      expect(subject.rolls).to contain_exactly(
        [0,0],
        [2,0],
        [0,2],
        [2,2],
        [1,0],
        [0,1],
        [1,2],
        [2,1]
      )
      expect(subject.num_accessible).to eq 8
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "4" }

    it "reports 43 accessible rolls" do
      expect(subject.num_accessible).to eq 43
    end
  end
end
