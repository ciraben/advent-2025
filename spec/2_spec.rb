require_relative "../solve/2"

RSpec.describe Solution do
  subject { Solution.new(input) }

  context "initially" do
    let(:input) { "1-2" }

    it "reports 0 invalid ids, 0 sum" do
      expect(subject.invalid_ids).to eq 0
      expect(subject.sum).to eq 0
    end
  end

  context "a single range with one invalid id" do
    let(:input) { "1-12" }

    it "reports 1 invalid id, 11" do
      expect(subject.invalid_ids).to eq 1
      expect(subject.sum).to eq 11
    end
  end

  context "multiple ranges" do
    let(:input) { "1-12,14-24,30-33,44-56,123-124" }

    it "reports 5 invalid ids (11,22,33,44,55) summing to 165" do
      expect(subject.invalid_ids).to eq 5
      expect(subject.sum).to eq 165
    end
  end

  context "big number range" do
    let(:input) { "38593856-38593862" }

    it "reports 1 invalid id, 38593859" do
      expect(subject.invalid_ids).to eq 1
      expect(subject.sum).to eq 38593859
    end
  end

  context "today's minidata input" do
    let(:input) { minidata "2" }

    it "reports 8 invalid ids summing to 1227775554" do
      expect(subject.invalid_ids).to eq 8
      expect(subject.sum).to eq 1227775554
    end
  end
end
