require 'spec_helper'

describe GuideboxWrapper do
  describe "GuideboxTv" do
    let!(:guidebox) { GuideboxWrapper::Tv.new(ENV["MY_API_KEY"], "all") }
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
    describe "#show_information" do
      it "returns entourage show" do
        expect(guidebox.show_information("entourage")["id"]).to eq(6085)
      end
    end
    describe "#status" do
      it "returns ended" do
        expect(guidebox.status("entourage")).to eq("Ended")
      end
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
    describe "#type" do
      it "returns television" do
        expect(guidebox.type("entourage")).to eq("television")
      end
    end
    describe "#first_aired" do
      it "returns 2004-07-18" do
        expect(guidebox.first_aired("entourage")).to eq("2004-07-18")
      end
    end
    describe "#network" do
      it "returns HBO" do
        expect(guidebox.network("entourage")).to eq("HBO")
      end
    end
    describe "#channel_information" do
      it "includes HBO" do
        expect(guidebox.channel_information("entourage").first["name"]).to eq("HBO")
      end
    end
    describe "#runtime" do
      it do
        expect(guidebox.runtime("entourage")).to eq(30)
      end
    end
    describe "#genres" do
      it "returns an array with Comedy and Drama" do
        genres = guidebox.genres("entourage").map{ |x| x["title"] }
        expect(genres).to include("Comedy")
        expect(genres).to include("Drama")
      end
    end
    describe "#tags" do
      it "has array of 16 tags" do
        expect(guidebox.tags("entourage").size).to eq(16)
      end
      it "includes womanizer and hollywood" do
        tags = guidebox.tags("entourage").map{ |x| x["tag"] }
        expect(tags).to include("womanizer")
        expect(tags).to include("hollywood")
      end
    end
    describe "#overview" do
      it "returns the shows overview" do
        expect(guidebox.overview("entourage")).to eq("Vincent Chase is a young actor whose career is on the rise. Joining him on his journey to stardom are his childhood buddies Eric, Turtle, his brother Johnny Drama and his hot-tempered agent Ari Gold. Together, they'll navigate the highs and lows of Hollywood's fast lane, where the stakes are higher -- and the money and temptations greater -- than ever before. ")
      end
    end
    describe "#air_day_of_week" do
      it "returns Sunday" do
        expect(guidebox.air_day_of_week("entourage")).to eq("Sunday")
      end
    end
    describe "#air_time" do
      it "returns 10:30 PM" do
        expect(guidebox.air_time("entourage")).to eq("10:30 PM")
      end
    end
    describe "#rating" do
      it "returns TV-MA" do
        expect(guidebox.rating("entourage")).to eq("TV-MA")
      end
    end
    describe "#imdb_id" do
      it "returns tt0387199" do
        expect(guidebox.imdb_id("entourage")).to eq("tt0387199")
      end
    end
    describe "#metacritic_link" do
      it "returns metacritic link" do
        expect(guidebox.metacritic_link("entourage")).to eq("http:\/\/www.metacritic.com\/tv\/entourage")
      end
    end
    describe "#wikipedia_id" do
      it "returns 907282" do
        expect(guidebox.wikipedia_id("entourage")).to eq(907282)
      end
    end
    describe "#facebook_link" do
      it "returns facebook link" do
        expect(guidebox.facebook_link("entourage")).to eq("https:\/\/www.facebook.com\/Entourage")
      end
    end
    describe "#twitter_link" do
      it "returns twitter link" do
        expect(guidebox.twitter_link("entourage")).to eq(nil)
      end
    end
    describe "#related" do
      it "includes Suits" do
        related = guidebox.related_shows("entourage")["results"].map{ |x| x["title"] }
        expect(related).to include("Suits")
        expect(related).to include("How I Met Your Mother")
      end
    end
    describe "#posters" do
      it "includes xlarge poster with link" do
        poster = guidebox.posters("entourage")["results"]["posters"].first["xlarge"]["url"]
        expect(poster).to eq("http:\/\/static-api.guidebox.com\/012915\/shows\/posters\/6085-3725524591-5295090941-3912000982-600x855.jpg")
      end
    end
    describe "#thumbnail_images" do
      it "includes thumbnail image with link" do
        thumbnail = guidebox.thumbnail_images("entourage")["results"]["thumbnails"].first["xlarge"]["url"]
        expect(thumbnail).to eq("http:\/\/static-api.guidebox.com\/091414\/thumbnails_xlarge\/6085-6340779560-608x342-show-thumbnail.jpg")
      end
    end
    describe "#banner_images" do
      it "includes banner image with link" do
        banner = guidebox.banner_images("entourage")["results"]["banners"].first["xlarge"]["url"]
        expect(banner).to eq("http:\/\/static-api.guidebox.com\/012915\/shows\/banners\/6085-6918728002-5154230813-6413012026-1300x240.jpg")
      end
    end
    describe "#background_images" do
      it "includes background image with link" do
        background = guidebox.background_images("entourage")["results"]["backgrounds"].first["original"]["url"]
        expect(background).to eq("http:\/\/static-api.guidebox.com\/012915\/shows\/backgrounds\/6085-96932638085-133215735918-888.jpg")
      end
    end
  end
end