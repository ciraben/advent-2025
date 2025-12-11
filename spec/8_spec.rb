require_relative "../solve/8"

RSpec.describe Solution_8 do
  subject { Solution_8.new(input) }

  context "a list of two junction boxes" do
    let(:input) { "0,0,0\n1,1,1" }

    it "connects the two boxes with a cable, for a product of 2" do
      subject.cables = 1
      subject.calculate

      expect(subject.points).to contain_exactly(
        Vector[0,0,0],
        Vector[1,1,1]
      )
      expect(subject.circuits).to contain_exactly(
        [Vector[0,0,0], Vector[1,1,1]]
      )
      expect(subject.product).to eq 2
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "8" }

    it "reports a product of 5x4x2 = 40 when using 10 cables" do
      subject.cables = 10
      subject.calculate

      expect(subject.product).to eq 40
    end
  end
end
