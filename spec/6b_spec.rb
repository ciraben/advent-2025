require_relative "../solve/6b"

RSpec.describe Solution_6B do
  subject { Solution_6B.new(input) }

  context "today's minidata input" do
    let(:input) { minidata "6" }

    it "reports four totals (1058, 3253600, 625, 8544) with sum 4277556" do
      expect(subject.answers).to contain_exactly 1058, 3253600, 625, 8544
      expect(subject.sum).to eq 3263827
    end
  end
end
