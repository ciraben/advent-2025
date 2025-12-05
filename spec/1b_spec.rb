require_relative "../solve/1b"

RSpec.describe Solution_1B do
  subject { Solution_1B.new(input) }

  context "an input of L55" do
    let(:input) { "L55" }

    it "moves the dial left to 95, striking zero once" do
      expect(subject.dial).to eq 95
      expect(subject.password).to eq 1
    end
  end

  context "an input of R1000" do
    let(:input) { "R1000" }

    it "moves the dial past zero 10 times, landing on 50" do
      expect(subject.dial).to eq 50
      expect(subject.password).to eq 10
    end
  end

  context "an input of L55\\nR6\\nL1\\nL100" do
    let(:input) { "L55\nR6\nL1\nL100" }

    it "moves the dial past zero 4 times, landing on 0" do
      expect(subject.dial).to eq 0
      expect(subject.password).to eq 4
    end
  end

  context "today's minidata input" do
    let(:input) { minidata("1") }

    it "calculates a password of 6" do
      expect(subject.password).to eq 6
    end
  end
end
