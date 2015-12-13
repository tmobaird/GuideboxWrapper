require 'spec_helper'

describe GuideboxWrapper do
	describe "GuideboxTv" do
		let(:guidebox) { GuideboxWrapper::Tv.new(CredentialsHelper.key, "all") }
		describe "#search_for" do
			it "returns entourage show" do
				expect(guidebox.show_information("entourage")["id"]).to eq(6085)
			end
			it "returns ended" do
				expect(guidebox.status("entourage")).to eq("Ended")
			end
			it "returns 8 seasons" do
				expect(guidebox.seasons("entourage").size).to eq(8)
			end
		end
	end
end