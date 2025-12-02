require_relative "../solve/1"

RSpec.describe Solution do
  subject { Solution.new(input) }

  context "without input" do
    let(:input) { "" }

    it "has an initial dial value of 50" do
      expect(subject.dial).to eq 50
    end

    it "has an initial password of 0" do
      expect(subject.password).to eq 0
    end
  end

  context "with single-line inputs" do
    context "an input of L5" do
      let(:input) { "L5" }

      it "moves the dial left five" do
        expect(subject.dial).to eq 45
      end
    end

    context "an input of R5" do
      let(:input) { "R5" }

      it "moves the dial right five" do
        expect(subject.dial).to eq 55
      end
    end

    context "an input of R50" do
      let(:input) { "R50" }

      it "wraps the dial to zero and increments the password" do
        expect(subject.dial).to eq 0
        expect(subject.password).to eq 1
      end
    end
  end

  context "with multi-line inputs" do
    context "an input of R50\\nL85\\nL15" do
      let(:input) { "R50\nL85\nL15" }

      it "parses each step and increments the password twice" do
        expect(subject.dial).to eq 0
        expect(subject.password).to eq 2
      end
    end

    context "today's minidata input" do
      let(:input) { minidata("1") }

      it "calculates a password of 3" do
        expect(subject.password).to eq 3
      end
    end
  end
end
