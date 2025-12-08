require_relative "../solve/5"

RSpec.describe Solution_5 do
  subject { Solution_5.new(input) }

  context "with a simple input" do
    let(:input) { "1-2\n\n3" }

    it "reports no ranges or fresh ids" do
      expect(subject.fresh_ranges).to eq [[1, 2]]
      expect(subject.fresh_ids).to be_empty
      expect(subject.count).to eq 0
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "5" }

    it "reports 3 fresh ingredients (5, 11, 17)" do
      expect(subject.fresh_ranges).to eq(
        [[3, 5], [10, 14], [12, 18], [16, 20]]
      )
      expect(subject.fresh_ids).to contain_exactly(
        5, 11, 17
      )
      expect(subject.count).to eq 3
    end
  end

  context "a long range" do
    let(:input) { "284509448628766-289381261597719\n\n67820823719488" }

    it "reports no fresh ingredients" do
      expect(subject.fresh_ranges).to eq [[284509448628766, 289381261597719]]
      expect(subject.count).to eq 0
    end
  end
end
