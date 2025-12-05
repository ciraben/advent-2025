require_relative "../solve/3"

RSpec.describe Solution do
  subject { Solution.new(input) }

  context "initially" do
    let(:input) { "" }

    it "reports a list of max joltages and their sum" do
      expect(subject.joltages).to be_empty
      expect(subject.sum).to eq 0
    end
  end

  context "a bank of joltages 11" do
    let(:input) { "11" }

    it "reports a max joltage of 11 and sum of 11" do
      expect(subject.joltages).to contain_exactly 11
      expect(subject.sum).to eq 11
    end
  end

  context "a bank of joltages 989" do
    let(:input) { "989" }

    it "reports a max joltage of 99 and sum of 99" do
      expect(subject.joltages).to contain_exactly 99
      expect(subject.sum).to eq 99
    end
  end

  context "multiple battery banks" do
    let(:input) { "989\n212\n" }

    it "reports maxes joltages of 99 and 22, sum of 121" do
      expect(subject.joltages).to contain_exactly 99, 22
      expect(subject.sum).to eq 121
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "3" }

    it "reports max joltages 98, 89, 78, 92 and sum  357" do
      expect(subject.joltages).to contain_exactly 98, 89, 78, 92
      expect(subject.sum).to eq 357
    end
  end
end
