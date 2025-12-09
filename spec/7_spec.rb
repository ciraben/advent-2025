require_relative "../solve/7"

RSpec.describe Solution_7 do
  subject { Solution_7.new(input) }

  context "the beam source" do
    let(:input) { ".S.\n..." }

    it "propagates a beam downward" do
      expect(subject.diagram).to contain_exactly(
        ".S.",
        ".|."
      )
      expect(subject.splits).to eq 0
    end
  end

  context "an existing beam above empty space" do
    let(:input) { ".|.\n..." }

    it "propagates a beam downward" do
      expect(subject.diagram).to contain_exactly(
        ".|.",
        ".|."
      )
      expect(subject.splits).to eq 0
    end
  end

  context "an existing beam above a splitter" do
    let(:input) { ".|.\n.^." }

    it "propagates beams to either side and counts a split" do
      expect(subject.diagram).to contain_exactly(
        ".|.",
        "|^|"
      )
      expect(subject.splits).to eq 1
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "7" }

    it "counts 21 splits" do
      expect(subject.splits).to eq 21
    end
  end
end
