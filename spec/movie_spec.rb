require 'spec_helper'

describe GuideboxWrapper do
  describe "GuideboxMovie" do
    let(:guidebox) { GuideboxWrapper::Movie.new(CredentialsHelper.key, "all") }
    describe "#search_for" do
      it "returns Back to the Future" do
        results = guidebox.search_for("back to the future")
        expect(results.first["id"]).to eq(35899)
        expect(results.first["title"]).to eq("Back to the Future")
        expect(results.first["release_year"]).to eq(1985)
      end
    end
  end
end