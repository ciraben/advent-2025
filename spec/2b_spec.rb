require_relative "../solve/2b"

RSpec.describe Solution_B do
  subject { Solution_B.new(input) }

  context "today's minidata input" do
    let(:input) { minidata "2" }

    it "reports 13 invalid ids summing to 4174379265" do
      expect(subject.invalid_ids_list).to contain_exactly(
        "11", "22", "99", "111", "999", "1010", "1188511885", "222222",
        "446446", "38593859", "565656", "824824824", "2121212121"
      )
      expect(subject.invalid_ids).to eq 13
      expect(subject.sum).to eq 4174379265
    end
  end
end
