require_relative "../solve/4"

RSpec.describe Solution_4 do
  subject { Solution_4.new(input) }

  context "initially" do
    let(:input) { "" }

    it "reports no accessible rolls" do
      expect(subject.num_accessible).to eq 0
    end
  end

  context "a simple roll diagram" do
    let(:input) {
      "@@@\n"<<
      "@.@\n"<<
      "@@@\n"
    }

    it "reports 4 accessible rolls" do
      expect(subject.rolls).to contain_exactly(
        [0,0],
        [2,0],
        [0,2],
        [2,2]
      )
      expect(subject.num_accessible).to eq 4
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "4" }

    it "reports 13 accessible rolls" do
      expect(subject.num_accessible).to eq 13
    end
  end
end
