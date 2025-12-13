require_relative "../solve/9b"

RSpec.describe Helper_9B do
  subject { Class.new { extend Helper_9B } }

  context "a_interior_to_bc?" do
    let(:corner) { [0, 0] }
    let(:another) { [2, 2] }

    context "interior points" do
      let(:inside) { [1, 1] }

      it "reports true, interior to the rectangle" do
        expect(subject.a_interior_to_bc? inside, corner, another).to be true
        expect(subject.a_interior_to_bc? inside, another, corner).to be true
      end
    end

    context "exterior points" do
      let(:outside) { [3, 0] }
      let(:outside_2) { [4, -1] }
      let(:outside_3) { [-1, 0] }

      it "reports false, exterior to the rectangle" do
        expect(subject.a_interior_to_bc? outside, corner, another).to be false
        expect(subject.a_interior_to_bc? outside_2, another, corner).to be false
        expect(subject.a_interior_to_bc? outside_3, another, corner).to be false
      end
    end

    context "edge points" do
      let(:edge) { [1, 0] }
      let(:edge_2) { [0, 2] }
      let(:edge_3) { [0, 0] }
      let(:edge_4) { [2, 1] }

      it "reports false, not interior to the rectangle" do
        expect(subject.a_interior_to_bc? edge, corner, another).to be false
        expect(subject.a_interior_to_bc? edge_2, another, corner).to be false
        expect(subject.a_interior_to_bc? edge_3, another, corner).to be false
        expect(subject.a_interior_to_bc? edge_4, another, corner).to be false
      end
    end
  end
end
