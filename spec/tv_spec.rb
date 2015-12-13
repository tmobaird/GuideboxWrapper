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
			describe "#seasons" do
				it "returns 8 seasons" do
					expect(guidebox.seasons("entourage").size).to eq(8)
				end
			end
			describe "#cast" do
				it "has value Jeremy Piven" do
					expect_cast = guidebox.cast("entourage").find { |h| h["name"] == "Jeremy Piven" }
					expect(expect_cast["name"]).to eq("Jeremy Piven")
				end
			end
			describe "#first_aired" do
				it "returns 2004-07-18" do
					expect(guidebox.first_aired("entourage")).to eq("2004-07-18")
				end
			end
		end
	end
end