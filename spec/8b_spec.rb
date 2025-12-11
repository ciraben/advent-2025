require_relative "../solve/8b"

RSpec.describe Solution_8B do
  subject { Solution_8B.new(input) }

  context "a list of two junction boxes" do
    let(:input) { "5,0,0\n7,1,1" }

    it "connects the 'last two' boxes immediately" do

      expect(subject.last_two).to contain_exactly(
        Vector[5,0,0],
        Vector[7,1,1]
      )
      expect(subject.product).to eq 35
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "8" }

    it "the magic connection identifies these points and their x-product" do
      expect(subject.last_two).to contain_exactly(
        Vector[216,146,977],
        Vector[117,168,530]
      )
      expect(subject.product).to eq 25272
    end
  end
end
