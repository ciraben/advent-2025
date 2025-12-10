require_relative "../solve/7b"

RSpec.describe Solution_7B do
  subject { Solution_7B.new(input) }

  context "a lonely splitter" do
    let(:input) { ".|.\n.^." }

    it "splits the possible paths" do
      expect(subject.diagram).to contain_exactly(
        [".", 1, "."],
        [1, "^", 1]
      )
      expect(subject.worlds).to eq 2
    end
  end

  context "a diagram with intersecting paths" do
    let(:input) { "|||\n^.^" }

    it "reports all path contributions to a cell" do
      expect(subject.diagram).to contain_exactly(
        [1, 1, 1],
        ["^", 3, "^"]
      )
      expect(subject.worlds).to eq 3
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "7" }

    it "reports 40 possible worlds" do
      expect(subject.worlds).to eq 40
    end
  end
end
