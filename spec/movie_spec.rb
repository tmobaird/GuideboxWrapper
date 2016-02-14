require 'spec_helper'

describe GuideboxWrapper do
  describe "GuideboxMovie" do
    let(:guidebox) { GuideboxWrapper::GuideboxMovie.new(ENV["MY_API_KEY"], "all") }
    after { sleep(1.5) }
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
    describe "#fetch_movie_by_db_id" do
      before(:all) do
        @guidebox_wrapper = GuideboxWrapper::GuideboxMovie.new(ENV["MY_API_KEY"], "all")
      end
      context "themoviedb" do
        it "returns movie with attributes for star wars" do
          star_wars = @guidebox_wrapper.fetch_movie_by_db_id(11, "themoviedb")
          expect(star_wars).to have_attributes(:id => 55413, :title => "Star Wars: Episode IV: A New Hope", :rating => "PG")
        end
      end
      context "imdb" do
        it "returns movie with attributes for star wars" do
          star_wars = @guidebox_wrapper.fetch_movie_by_db_id("tt0076759", "imdb")
          expect(star_wars).to have_attributes(:id => 55413, :title => "Star Wars: Episode IV: A New Hope", :rating => "PG")
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
    describe "fetch_movie" do
      context "Star Wars A New Hope" do
        before(:all) do
          guidebox_wrapper = GuideboxWrapper::GuideboxMovie.new(ENV["MY_API_KEY"], "all")
          @star_wars = guidebox_wrapper.fetch_movie("star wars a new hope")
        end
        describe "#cast" do
          it "includes Mark Hammill as Luke Skywalker" do
            expect(@star_wars.cast).to include({"id"=>300791, "name"=>"Mark Hamill", "character_name"=>"Luke Skywalker"})
          end
          it "includes Harrison Ford as Han Solo" do
            expect(@star_wars.cast).to include({"id"=>212668, "name"=>"Harrison Ford", "character_name"=>"Han Solo"})
          end
        end
        describe "#writers" do
          it "includes George Lucas" do
            expect(@star_wars.writers).to include({"id"=>527769, "name"=>"George Lucas"})
          end
        end
        describe "#directors" do
          it "includes George Lucas" do
            expect(@star_wars.directors).to include({"id"=>527769, "name"=>"George Lucas"})
          end
        end
        describe "#release_year" do
          it "returns 1977" do
            expect(@star_wars.release_year).to eq(1977)
          end
        end
        describe "#release_date" do
          it "returns 1977-05-25" do
            expect(@star_wars.release_date).to eq("1977-05-25")
          end
        end
        describe "#rating" do
          it "returns PG" do
            expect(@star_wars.rating).to eq("PG")
          end
        end
        describe "#duration" do
          it "returns 7260" do
            expect(@star_wars.duration).to eq(7260)
          end
        end
        describe "#themoviedb_id" do
          it "returns 11" do
            expect(@star_wars.themoviedb).to eq(11)
          end
        end
        describe "#imdb_id" do
          it "returns tt0076759" do
            expect(@star_wars.imdb).to eq("tt0076759")
          end
        end
        describe "#rotten_tomatoes_id" do
          it "returns 11292" do
            expect(@star_wars.rottentomatoes).to eq(11292)
          end
        end
        describe "#alternate_titles" do
          it "includes Star Wars Episode IV - A New Hope" do
            expect(@star_wars.alternate_titles).to include("Star Wars Episode IV - A New Hope")
          end
        end
        describe "#freebase" do
          it "returns /m/0dtfn" do
            expect(@star_wars.freebase).to eq("/m/0dtfn")
          end
        end
        describe "#wikipedia_id" do
          it "returns 52549" do
            expect(@star_wars.wikipedia_id).to eq(52549)
          end
        end
        describe "#metacritic_link" do
          it "returns http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope" do
            expect(@star_wars.metacritic).to eq("http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope")
          end
        end
        describe "#overview" do
          it "returns movie overview" do
            expect(@star_wars.overview).to eq("Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.")
          end
        end
        describe "#genres" do
          it "includes Science Fiction" do
            expect(@star_wars.genres).to include({"id"=>21, "title"=>"Science-Fiction"})
          end
        end
        describe "#tags" do
          it "includes Lightsaber" do
            expect(@star_wars.tags).to include({"id"=>9193, "tag"=>"lightsaber"})
          end
        end
        describe "#free_web_sources" do
          it "returns an empty array" do
            expect(@star_wars.free_web_sources).to eq([])
          end
        end
        describe "#free_ios_sources" do
          it "returns an empty array" do
            expect(@star_wars.free_ios_sources).to eq([])
          end
        end
        describe "#free_android_sources" do
          it "returns an empty array" do
            expect(@star_wars.free_android_sources).to eq([])
          end
        end
        describe "#subscription_web_sources" do
          it "includes now_tv channel and link" do
            expect(@star_wars.subscription_web_sources).to include({"source"=>"now_tv", "display_name"=>"NOW TV", "link"=>"http://watch.nowtv.com/watch-movies/star-wars-episode-iv-new-hope-1977/d3742a916796e410VgnVCM1000000b43150a____"})
          end
        end
        describe "#purchase_web_sources" do
          it "includes itunes and link" do
            expect(@star_wars.purchase_web_sources).to include({"source"=>"itunes", "display_name"=>"iTunes", "link"=>"https://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481?uo=4&at=10laHb", "formats"=>[{"price"=>"19.99", "format"=>"SD", "type"=>"purchase", "pre_order"=>false}, {"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]})
          end
        end
        describe "#purchase_ios_sources" do
          it "includes itunes and link" do
            expect(@star_wars.purchase_ios_sources).to include({"source"=>"itunes", "display_name"=>"iTunes", "link"=>"itms://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481?uo=4&at=10laHb", "app_name"=>"iTunes", "app_link"=>1, "app_required"=>1, "app_download_link"=>"itms-apps://", "formats"=>[{"price"=>"19.99", "format"=>"SD", "type"=>"purchase", "pre_order"=>false}, {"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]})
          end
        end
        describe "#purchase_android_sources" do
          it "includes google play and link" do
            expect(@star_wars.purchase_android_sources).to include({"source"=>"google_play", "display_name"=>"Google Play", "link"=>"https://play.google.com/store/movies/details?id=yYNSSNJ0z_U", "app_name"=>"Google Play", "app_link"=>0, "app_required"=>0, "app_download_link"=>"https://play.google.com/store", "formats"=>[{"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]})
          end
        end
        describe "images=" do
          context "when images are not set" do
            it "returns nil" do
              expect(@star_wars.posters).to eq(nil)
            end
          end
          context "when images are set" do
            before(:all) { @star_wars.images=(ENV["MY_API_KEY"]) }
            describe "#posters" do
              it "includes link to large poster" do
                expect(@star_wars.posters.first["large"]).to include("url"=>"http://static-api.guidebox.com/022615/thumbnails_movies/-alt--55413-2929921416-5712237544-4512474872-large-400x570-alt-.jpg")
              end
            end
            describe "#backgrounds" do
              it "includes link to original banner" do
                expect(@star_wars.backgrounds.first["original"]).to include("url"=>"http://static-api.guidebox.com/012915/movies/backgrounds/55413-83836050721-144034282636-0.jpg")
              end
            end
            describe "#banners" do
              it "includes link to xlarge banner" do
                expect(@star_wars.banners.first["xlarge"]).to include("url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-1300x240.jpg")
              end
            end
            describe "#thumbnails" do
              it "includes link to xlarge thumbnail" do
                expect(@star_wars.thumbnails.first["xlarge"]).to include("url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-608x342.jpg")
              end
            end
            describe "#large_posters" do
              it "includes link to large poster" do
                expect(@star_wars.large_posters.first).to include("url"=>"http://static-api.guidebox.com/022615/thumbnails_movies/-alt--55413-2929921416-5712237544-4512474872-large-400x570-alt-.jpg")
              end
            end
            describe "#medium_posters" do
              it "includes link to medium poster" do
                expect(@star_wars.medium_posters.first).to include("url"=>"http://static-api.guidebox.com/022615/thumbnails_movies_medium/55413-7503386526-8892287802-9208222483-medium-240x342-alt-.jpg")
              end
            end
            describe "#small_posters" do
              it "includes link to small poster" do
                expect(@star_wars.small_posters.first).to include("url"=>"http://static-api.guidebox.com/022615/thumbnails_movies_small/55413-2337345113-5651742173-3505870658-small-120x171-alt-.jpg")
              end
            end
            describe "#xlarge_banners" do
              it "includes link to xlarge banner" do
                expect(@star_wars.xlarge_banners.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-1300x240.jpg")   
              end
            end
            describe "#large_banners" do
              it "includes link to large banner" do
                expect(@star_wars.large_banners.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-1000x185.jpg")     
              end
            end
            describe "#medium_banners" do
              it "includes link to the medium banner" do
                expect(@star_wars.medium_banners.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-756x140.jpg")
              end
            end
            describe "#small_banners" do
              it "includes link to small banner" do
                expect(@star_wars.small_banners.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-551x102.jpg")  
              end
            end
            describe "xlarge_thumbnails" do
              it "includes link to xlarge thumbnail" do
                expect(@star_wars.xlarge_thumbnails.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-608x342.jpg")  
              end
            end
            describe "large_thumbnails" do
              it "includes link to large thumbnail" do
                expect(@star_wars.large_thumbnails.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-448x252.jpg")  
              end
            end
            describe "medium_thumbnails" do
              it "includes link to medium thumbnail" do
                expect(@star_wars.medium_thumbnails.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-304x171.jpg")  
              end
            end
            describe "small_thumbnails" do
              it "includes link to small thumbnail" do
                expect(@star_wars.small_thumbnails.first).to include("url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-208x117.jpg")  
              end
            end
          end
        end
      end
      context "Star Wars Revenge of the Sith" do
        before(:all) do
          guidebox_wrapper = GuideboxWrapper::GuideboxMovie.new(ENV["MY_API_KEY"], "all")
          @rots = guidebox_wrapper.fetch_movie("Star Wars Revenge of the Sith")
        end
        describe "#facebook_link" do
          it "returns https://www.facebook.com/pages/Star-Wars-Episode-III-Revenge-of-the-Sith/105663472799675" do
            expect(@rots.facebook_link).to eq("https://www.facebook.com/pages/Star-Wars-Episode-III-Revenge-of-the-Sith/105663472799675")
          end
        end
        describe "#web_trailers" do
          it "includes link to trailer" do
            expect(@rots.web_trailers.first).to include("link" => "http://www.guidebox.com/watch-now.php?video=53201")
          end
        end
        describe "#ios_trailers" do
          it "includes link to trailer" do
            expect(@rots.ios_trailers.first).to include("link" => "http://www.guidebox.com/watch-now.php?video=53201")
          end
        end
        describe "#android_trailers" do
          it "includes link to trailer" do
            expect(@rots.android_trailers.first).to include("link" => "http://www.guidebox.com/watch-now.php?video=53201")
          end
        end
      end
      context "Ghosbusters" do
        before(:all) do
          guidebox_wrapper = GuideboxWrapper::GuideboxMovie.new(ENV["MY_API_KEY"], "all")
          @ghostbusters = guidebox_wrapper.fetch_movie("ghostbusters")
        end
        describe "#tv_everywhere_web_sources" do
          it "includes channel and link" do
            expect(@ghostbusters.tv_everywhere_web_sources).to include({"source"=>"sky_go_tveverywhere", "display_name"=>"Sky Go", "tv_channel"=>"Sky Movies", "link"=>"http://go.sky.com/vod/content/Sky_Movies/All/content/videoId/e521ff9a1e0b7410VgnVCM1000000b43150a________/content/default/videoDetailsPage.do"})
          end
        end
      end
      context "Godzilla" do
        before(:all) do
          guidebox_wrapper = GuideboxWrapper::GuideboxMovie.new(ENV["MY_API_KEY"], "all")
          @godzilla = guidebox_wrapper.fetch_movie("godzilla")
        end
        describe "#tv_everywhere_ios_sources" do
          it "includes channel and link" do
            expect(@godzilla.tv_everywhere_ios_sources).to include({"source"=>"maxgo", "display_name"=>"MAX GO", "tv_channel"=>"Cinemax", "link"=>"maxgo://deeplink/MO.MO/MGOROSTGP38072", "app_name"=>"MAX GO", "app_link"=>1, "app_required"=>1, "app_download_link"=>"itms-apps://itunes.apple.com/app/max-go/id453560335"})
          end
        end
        describe "#tv_everywhere_android_sources" do
          it "includes channel and link" do
            expect(@godzilla.tv_everywhere_android_sources).to include({"source"=>"maxgo", "display_name"=>"MAX GO", "tv_channel"=>"Cinemax", "link"=>"maxgo://deeplink/MO.MO/MGOROSTGP38072", "app_name"=>"MAX GO", "app_link"=>1, "app_required"=>1, "app_download_link"=>"https://play.google.com/store/apps/details?id=com.MAXGo"})
          end
        end
      end
    end
  end
end