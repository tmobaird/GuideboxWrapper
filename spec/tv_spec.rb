require 'spec_helper'

describe GuideboxWrapper do
  describe "GuideboxTv" do
    let!(:guidebox) { GuideboxWrapper::GuideboxTv.new(ENV["MY_API_KEY"], "all") }
    after { sleep(1.5) }
    describe "#search_for" do
      it "includes entourage" do
        expect(guidebox.search_for("entourage").first["title"]).to eq("Entourage")
      end
    end
    describe "#search_for_by_provider" do
      it "includes entourage" do
        expect(guidebox.search_for_by_provider("entourage", "hbo").first["title"]).to eq("Entourage")
      end
    end
    describe "#search_by_db_id" do
      context "imdb id" do
        it "includes entourage" do
          expect(guidebox.search_by_db_id("tt0387199", "imdb")["title"]).to eq("Entourage")
        end
      end
      context "tvdb id" do
        it "includes entourage" do
          expect(guidebox.search_by_db_id(74543, "tvdb")["title"]).to eq("Entourage")
        end
      end
      context "the movie db id" do
        it "includes entourage" do
          expect(guidebox.search_by_db_id(1940, "themoviedb")["title"]).to eq("Entourage")
        end
      end
    end
    describe "#fetch_tv_show_by_db_id" do
      context "imdb id" do
        it "returns tv object attributes for always sunny in philadelphia" do
          sunny = guidebox.fetch_tv_show_by_db_id("tt0472954", "imdb")
          expect(sunny).to have_attributes(:id => 612, :title => "It's Always Sunny in Philadelphia", :first_aired => "2005-08-04", :rating => "TV-MA")
        end
      end
      context "tvdb id" do
        it "returns tv object attributes for always sunny in philadelphia" do
          sunny = guidebox.fetch_tv_show_by_db_id(75805, "tvdb")
          expect(sunny).to have_attributes(:id => 612, :title => "It's Always Sunny in Philadelphia", :first_aired => "2005-08-04", :rating => "TV-MA")
        end
      end
      context "the movie db id" do
        it "returns tv object attributes for always sunny in philadelphia" do
          sunny = guidebox.fetch_tv_show_by_db_id(2710, "themoviedb")
          expect(sunny).to have_attributes(:id => 612, :title => "It's Always Sunny in Philadelphia", :first_aired => "2005-08-04", :rating => "TV-MA")   
        end
      end
    end
    describe "#show_information" do
      it "returns entourage show" do
        expect(guidebox.show_information("entourage")["id"]).to eq(6085)
      end
    end
    describe "#fetch_tv_show" do
      it "returns a tv object with attributes" do
        sunny = guidebox.fetch_tv_show("always sunny in philadelphia")
        expect(sunny).to have_attributes(:id => 612, :title => "It's Always Sunny in Philadelphia", :first_aired => "2005-08-04", :rating => "TV-MA")   
      end
      describe "Tv" do
        before(:all) do
          guidebox_wrapper = GuideboxWrapper::GuideboxTv.new(ENV["MY_API_KEY"], "all")
          @sunny = guidebox_wrapper.fetch_tv_show("always sunny in philadelphia")
        end
        it "has tv information attributes" do
          expect(@sunny).to have_attributes(:id => 612, :title => "It's Always Sunny in Philadelphia", :air_day_of_week => "Wednesday", :air_time => "10:00 PM", :fanart => "http://static-api.guidebox.com/041014/fanart/612-0-0-0-131663791960-123862804587-18376520218-tv.jpg", :first_aired => "2005-08-04", :freebase => "/m/07ct0z", :imdb_id => "tt0472954", :network => "FXX", :rating => "TV-MA", :runtime => 30)
        end
        describe "seasons=" do
          it "returns nil before called" do
            expect(@sunny.seasons).to eq(nil)
          end
          it "returns 11 for season total after called" do
            @sunny.seasons=(ENV["MY_API_KEY"])
            expect(@sunny.season_total).to eq(11)
          end
        end
        describe "sources=" do
          context "when sources are not set" do
            it "returns must set sources message" do
              expect(@sunny.web_sources).to eq("You need to call sources=(api_key) first")
            end
          end
          context "when sources are set" do
            before(:all) { @sunny.sources=(ENV["MY_API_KEY"]) }
            it "has does not return not set message" do
              expect(@sunny.web_sources).to_not eq("You need to call sources=(api_key) first")
            end
            describe "#web_sources" do
              it "includes amazon prime" do
                expect(@sunny.web_sources["episodes"]["all_sources"]).to include({"id"=>146, "source"=>"amazon_buy", "display_name"=>"Amazon", "type"=>"purchase"})
              end
            end
            describe "#ios_sources" do
              it "includes itunes" do
                expect(@sunny.ios_sources["episodes"]["all_sources"]).to include({"id"=>145, "source"=>"itunes", "display_name"=>"iTunes", "type"=>"purchase"})
              end
            end
            describe "#android_sources" do
              it "includes google play" do
                expect(@sunny.android_sources["episodes"]["all_sources"]).to include({"id"=>148, "source"=>"google_play", "display_name"=>"Google Play", "type"=>"purchase"})
              end
            end
            describe '#free_sources' do
              it "returns an empty array" do
                expect(@sunny.free_sources).to eq([])
              end
            end
            describe '#subscription_sources' do
              it "includes amazon prime" do
                expect(@sunny.subscription_sources).to include({"id"=>13, "source"=>"amazon_prime", "display_name"=>"Amazon Prime", "type"=>"web"})
              end
            end
            describe '#purchase_sources' do
              it "includes amazon_buy" do
                expect(@sunny.purchase_sources).to include({"id"=>146, "source"=>"amazon_buy", "display_name"=>"Amazon", "type"=>"web"})
              end
            end
          end
        end
        describe "related=" do
          context "when related is not set" do
            it 'returns nil' do
              expect(@sunny.related).to eq(nil)
            end
          end
          context "when related is set" do
            before(:all) { @sunny.related=(ENV["MY_API_KEY"]) }
            it "does not return nil" do
              expect(@sunny.related).to_not eq(nil)
            end
            describe "#related" do
              it "includes the office" do
                expect(@sunny.related.first["title"]).to eq("The Office")
              end
            end
          end
        end
        describe "#small_artwork" do
          it "returns url to artwork" do
            expect(@sunny.small_artwork).to eq("http://static-api.guidebox.com/091414/thumbnails_small/612-6098058661-208x117-show-thumbnail.jpg")
          end
        end
        describe "#medium_artwork" do
          it "returns url to artwork" do
            expect(@sunny.medium_artwork).to eq("http://static-api.guidebox.com/091414/thumbnails_medium/612-5730778291-304x171-show-thumbnail.jpg")
          end
        end
        describe "#large_artwork" do
          it "returns url to artwork" do
            expect(@sunny.large_artwork).to eq("http://static-api.guidebox.com/091414/thumbnails_large/612-6969761858-448x252-show-thumbnail.jpg")
          end
        end
        describe "#xlarge_artwork" do
          it "returns url to artwork" do
            expect(@sunny.xlarge_artwork).to eq("http://static-api.guidebox.com/091414/thumbnails_xlarge/612-1023839778-608x342-show-thumbnail.jpg")
          end
        end
      end
    end
    describe "#posters" do
      it "includes xlarge poster with link" do
        poster = guidebox.posters("entourage").first["xlarge"]["url"]
        expect(poster).to eq("http:\/\/static-api.guidebox.com\/012915\/shows\/posters\/6085-3725524591-5295090941-3912000982-600x855.jpg")
      end
    end
    describe "#thumbnail_images" do
      it "includes thumbnail image with link" do
        thumbnail = guidebox.thumbnail_images("entourage").first["xlarge"]["url"]
        expect(thumbnail).to eq("http:\/\/static-api.guidebox.com\/091414\/thumbnails_xlarge\/6085-6340779560-608x342-show-thumbnail.jpg")
      end
    end
    describe "#banner_images" do
      it "includes banner image with link" do
        banner = guidebox.banner_images("entourage").first["xlarge"]["url"]
        expect(banner).to eq("http:\/\/static-api.guidebox.com\/012915\/shows\/banners\/6085-6918728002-5154230813-6413012026-1300x240.jpg")
      end
    end
    describe "#background_images" do
      it "includes background image with link" do
        background = guidebox.background_images("entourage").first["original"]["url"]
        expect(background).to eq("http:\/\/static-api.guidebox.com\/012915\/shows\/backgrounds\/6085-96932638085-133215735918-888.jpg")
      end
    end
  end
end