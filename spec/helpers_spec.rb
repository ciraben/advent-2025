require_relative "../solve/helpers"

RSpec.describe "custom helper methods" do
  context "minidata" do
    it "fetches text from minidata files and returns as string" do
      expect(minidata "example").to eq "some mini data\n"
    end
  end

  context "data" do
    it "fetches text from data files and returns as string" do
      expect(data "example").to eq "some data\n"
    end
  end
end
