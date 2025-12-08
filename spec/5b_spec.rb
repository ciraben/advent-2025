require_relative "../solve/5b"

RSpec.describe Solution_5B do
  subject { Solution_5B.new(input) }

  context "today's minidata input" do
    let(:input) { minidata "5" }

    it "has a total of 14 ids in its ranges" do
      expect(subject.count).to eq 14
    end
  end

  context "a range of one" do
    let(:input) { "1073900165685-1073900165685\n\n1" }

    it "reports one fresh id" do
      expect(subject.count).to eq 1
    end
  end

  context "a bunch of ranges containing each other" do
    let(:input) { "1-10\n2-3\n4-5\n5-6\n7-10\n9-12\n\n1" }

    it "reports one fresh id" do
      expect(subject.count).to eq 12
    end
  end

  context "a range contained entirely within another" do
    let(:input) { "1-10\n2-3\n\n1" }

    it "reports fresh ids equal to the larger range" do
      expect(subject.count).to eq 10
    end
  end
end
