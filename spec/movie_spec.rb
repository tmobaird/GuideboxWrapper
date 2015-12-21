require 'spec_helper'

describe GuideboxWrapper do
  describe "GuideboxMovie" do
    let(:guidebox) { GuideboxWrapper::Movie.new(ENV["MY_API_KEY"], "all") }
    describe "#search_for" do
      it "returns Star Wars: A New Hope" do
        results = guidebox.search_for("star wars a new hope")
        expect(results.first["id"]).to eq(55413)
        expect(results.first["title"]).to eq("Star Wars: Episode IV: A New Hope")
      end
    end
    describe "#search_for_by_provider" do
      it "returns Star Wars: A New Hope" do
        results = guidebox.search_for_by_provider("star wars a new hope", "amazon_prime")
        expect(results.first["id"]).to eq(55413)
        expect(results.first["title"]).to eq("Star Wars: Episode IV: A New Hope")
      end
    end
    describe "#search_by_db_id" do
      context "themoviedb" do
        it "returns Star Wars: A New Hope" do
          results = guidebox.search_by_db_id(11, "themoviedb")
          expect(results["title"]).to eq("Star Wars: Episode IV: A New Hope")
        end
      end
      context "imdb" do
        it "returns Star Wars: A New Hope" do
          results = guidebox.search_by_db_id("tt0076759", "imdb")
          expect(results["title"]).to eq("Star Wars: Episode IV: A New Hope")
        end
      end
    end
    describe "#show_information" do
      it "returns information for Star Wars: A New Hope" do
        results = guidebox.show_information("star wars a new hope")
        expect(results["id"]).to eq(55413)
        expect(results["title"]).to eq("Star Wars: Episode IV: A New Hope")
        expect(results).to include("overview")
      end
    end
    describe "#cast" do
      it "includes Mark Hammill as Luke Skywalker" do
        expect(guidebox.cast("star wars a new hope")).to include({"id"=>300791, "name"=>"Mark Hamill", "character_name"=>"Luke Skywalker"})
      end
      it "includes Harrison Ford as Han Solo" do
        expect(guidebox.cast("star wars a new hope")).to include({"id"=>212668, "name"=>"Harrison Ford", "character_name"=>"Han Solo"})
      end
    end
    describe "#writers" do
      it "includes George Lucas" do
        expect(guidebox.writers("star wars a new hope")).to include({"id"=>527769, "name"=>"George Lucas"})
      end
    end
    describe "#directors" do
      it "includes George Lucas" do
        expect(guidebox.directors("star wars a new hope")).to include({"id"=>527769, "name"=>"George Lucas"})
      end
    end
    describe "#release_year" do
      it "returns 1977" do
        expect(guidebox.release_year("star wars a new hope")).to eq(1977)
      end
    end
    describe "#release_date" do
      it "returns 1977-05-25" do
        expect(guidebox.release_date("star wars a new hope")).to eq("1977-05-25")
      end
    end
    describe "#rating" do
      it "returns PG" do
        expect(guidebox.rating("star wars a new hope")).to eq("PG")
      end
    end
    describe "#duration" do
      it "returns 7260" do
        expect(guidebox.duration("star wars a new hope")).to eq(7260)
      end
    end
    describe "#themoviedb_id" do
      it "returns 11" do
        expect(guidebox.themoviedb_id("star wars a new hope")).to eq(11)
      end
    end
    describe "#imdb_id" do
      it "returns tt0076759" do
        expect(guidebox.imdb_id("star wars a new hope")).to eq("tt0076759")
      end
    end
    describe "#rotten_tomatoes_id" do
      it "returns 11292" do
        expect(guidebox.rotten_tomatoes_id("star wars a new hope")).to eq(11292)
      end
    end
    describe "#alternate_titles" do
      it "includes Star Wars Episode IV - A New Hope" do
        expect(guidebox.alternate_titles("star wars a new hope")).to include("Star Wars Episode IV - A New Hope")
      end
    end
    describe "#freebase" do
      it "returns /m/0dtfn" do
        expect(guidebox.freebase("star wars a new hope")).to eq("/m/0dtfn")
      end
    end
    describe "#wikipedia_id" do
      it "returns 52549" do
        expect(guidebox.wikipedia_id("star wars a new hope")).to eq(52549)
      end
    end
    describe "#metacritic_link" do
      it "returns http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope" do
        expect(guidebox.metacritic_link("star wars a new hope")).to eq("http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope")
      end
    end
    describe "#overview" do
      it "returns movie overview" do
        expect(guidebox.overview("star wars a new hope")).to eq("Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.")
      end
    end
    describe "#genres" do
      it "includes Science Fiction" do
        expect(guidebox.genres("star wars a new hope")).to include({"id"=>21, "title"=>"Science-Fiction"})
      end
    end
    describe "#tags" do
      it "includes Lightsaber" do
        expect(guidebox.tags("star wars a new hope")).to include({"id"=>9193, "tag"=>"lightsaber"})
      end
    end
    describe "#facebook_link" do
      it "returns https://www.facebook.com/pages/Star-Wars-Episode-III-Revenge-of-the-Sith/105663472799675" do
        expect(guidebox.facebook_link("star wars revenge of the sith")).to eq("https://www.facebook.com/pages/Star-Wars-Episode-III-Revenge-of-the-Sith/105663472799675")
      end
    end
    describe "#web_trailers" do
      it "includes link to trailer" do
        expect(guidebox.web_trailers("star wars revenge of the sith").first).to include("link" => "http://www.guidebox.com/watch-now.php?video=53201")
      end
    end
    describe "#ios_trailers" do
      it "includes link to trailer" do
        expect(guidebox.ios_trailers("star wars revenge of the sith").first).to include("link" => "http://www.guidebox.com/watch-now.php?video=53201")
      end
    end
    describe "#android_trailers" do
      it "includes link to trailer" do
        expect(guidebox.android_trailers("star wars revenge of the sith").first).to include("link" => "http://www.guidebox.com/watch-now.php?video=53201")
      end
    end
    describe "#posters" do
      it "includes large poster" do
        expect(guidebox.posters("star wars a new hope").first).to include("large"=>{"url"=>"http://static-api.guidebox.com/022615/thumbnails_movies/-alt--55413-2929921416-5712237544-4512474872-large-400x570-alt-.jpg", "width"=>400, "height"=>570})
      end
    end
    describe "#thumbnail_images" do
      it "includes xl thumbnail" do
        expect(guidebox.thumbnail_images("star wars a new hope").first).to include("xlarge"=>{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-608x342.jpg", "width"=>608, "height"=>342})
      end
    end
    describe "#banner_images" do
      it "includes xl banner" do
        expect(guidebox.banner_images("star wars a new hope").first).to include("xlarge"=>{"url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-1300x240.jpg", "width"=>1300, "height"=>240})
      end
    end
    describe "#background_images" do
      it "includes original background" do
        expect(guidebox.background_images("star wars a new hope")).to include({"original"=>{"url"=>"http://static-api.guidebox.com/012915/movies/backgrounds/55413-83836050721-144034282636-0.jpg", "width"=>1920, "height"=>1080}, "original_width"=>1920, "original_height"=>1080, "image_rating"=>0})
      end
    end
    describe "#free_web_sources" do
      it "returns an empty array" do
        expect(guidebox.free_web_sources("star wars a new hope")).to eq([])
      end
    end
    describe "#free_ios_sources" do
      it "returns an empty array" do
        expect(guidebox.free_ios_sources("star wars a new hope")).to eq([])
      end
    end
    describe "#free_android_sources" do
      it "returns an empty array" do
        expect(guidebox.free_android_sources("star wars a new hope")).to eq([])
      end
    end
    describe "#tv_everywhere_web_sources" do
      it "includes channel and link" do
        expect(guidebox.tv_everywhere_web_sources("ghostbusters")).to include({"source"=>"sky_go_tveverywhere", "display_name"=>"Sky Go", "tv_channel"=>"Sky Movies", "link"=>"http://go.sky.com/vod/content/Sky_Movies/All/content/videoId/e521ff9a1e0b7410VgnVCM1000000b43150a________/content/default/videoDetailsPage.do"})
      end
    end
    describe "#tv_everywhere_ios_sources" do
      it "includes channel and link" do
        expect(guidebox.tv_everywhere_ios_sources("godzilla")).to include({"source"=>"maxgo", "display_name"=>"MAX GO", "tv_channel"=>"Cinemax", "link"=>"maxgo://deeplink/MO.MO/MGOROSTGP38072", "app_name"=>"MAX GO", "app_link"=>1, "app_required"=>1, "app_download_link"=>"itms-apps://itunes.apple.com/app/max-go/id453560335"})
      end
    end
    describe "#tv_everywhere_android_sources" do
      it "includes channel and link" do
        expect(guidebox.tv_everywhere_android_sources("godzilla")).to include({"source"=>"maxgo", "display_name"=>"MAX GO", "tv_channel"=>"Cinemax", "link"=>"maxgo://deeplink/MO.MO/MGOROSTGP38072", "app_name"=>"MAX GO", "app_link"=>1, "app_required"=>1, "app_download_link"=>"https://play.google.com/store/apps/details?id=com.MAXGo"})
      end
    end
    describe "#subscription_web_sources" do
      it "includes now_tv channel and link" do
        expect(guidebox.subscription_web_sources("star wars a new hope")).to include({"source"=>"now_tv", "display_name"=>"NOW TV", "link"=>"http://watch.nowtv.com/watch-movies/star-wars-episode-iv-new-hope-1977/d3742a916796e410VgnVCM1000000b43150a____"})
      end
    end
    describe "#purchase_web_sources" do
      it "includes itunes and link" do
        expect(guidebox.purchase_web_sources("star wars a new hope")).to include({"source"=>"itunes", "display_name"=>"iTunes", "link"=>"https://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481?uo=4&at=10laHb", "formats"=>[{"price"=>"19.99", "format"=>"SD", "type"=>"purchase", "pre_order"=>false}, {"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]})
      end
    end
    describe "#purchase_ios_sources" do
      it "includes itunes and link" do
        expect(guidebox.purchase_ios_sources("star wars a new hope")).to include({"source"=>"itunes", "display_name"=>"iTunes", "link"=>"itms://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481?uo=4&at=10laHb", "app_name"=>"iTunes", "app_link"=>1, "app_required"=>1, "app_download_link"=>"itms-apps://", "formats"=>[{"price"=>"19.99", "format"=>"SD", "type"=>"purchase", "pre_order"=>false}, {"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]})
      end
    end
    describe "#purchase_android_sources" do
      it "includes google play and link" do
        expect(guidebox.purchase_android_sources("star wars a new hope")).to include({"source"=>"google_play", "display_name"=>"Google Play", "link"=>"https://play.google.com/store/movies/details?id=yYNSSNJ0z_U", "app_name"=>"Google Play", "app_link"=>0, "app_required"=>0, "app_download_link"=>"https://play.google.com/store", "formats"=>[{"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]})
      end
    end
  end
end