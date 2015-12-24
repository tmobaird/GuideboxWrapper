# GuideboxWrapper

[![Code Climate](https://codeclimate.com/github/tmobaird/GuideboxWrapper/badges/gpa.svg)](https://codeclimate.com/github/tmobaird/GuideboxWrapper)
[![Test Coverage](https://codeclimate.com/github/tmobaird/GuideboxWrapper/badges/coverage.svg)](https://codeclimate.com/github/tmobaird/GuideboxWrapper/coverage)
[![Build Status](https://travis-ci.org/tmobaird/GuideboxWrapper.svg?branch=master)](https://travis-ci.org/tmobaird/GuideboxWrapper)

Guidebox Wrapper is a Ruby Wrapper for the Guidebox API. The Guidebox API contains tons of information about tv shows and movies. This gem will help you extract data from this API in a simple way. It contains an array of different methods that allow you to obtain different information about a movie/tv show. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'GuideboxWrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install GuideboxWrapper

## Usage

To use this gem you must first register for a personal API key on Guidebox's website. This registration page can be found here: [Guidebox API key registration page](https://api.guidebox.com/production-key). Once you obtain your personal API key (which should be randomized string of numbers and characters) you will be able to start using this gem.

**Do not use yet, this Gem is not currently active on RubyGems**

The API helpers throughout this gem can be called on either Tv or Movie objects. These objects can be initialized by doing the following:

```ruby
GuideboxWrapper::Tv.new("YOUR_API_KEY", "region") # region can be "all", "US" (United States), "GB" (Great Britain), etc

GuideboxWrapper::Movie.new("YOUR_API_KEY", "region") # region can be "all", "US" (United States), "GB" (Great Britain), etc
```

Keep in mind that Guidebox has some restrictions on the amount of API calls that can be made per month and per second. The API is limited to 100,000 API calls a month and 1 API call per second. The monthy limit of 100,000 resets on the 1st of every month. To check the amont of API calls you have made in the current month use the quota helper. It can be called on either a GuideboxWrapper::Movie Or GuideboxWrapper::Tv object as follows:

```ruby
tv = GuideboxWrapper::Tv.new("YOUR_API_KEY", "region")
tv.quota
# => 5500

movie = GuideboxWrapper::Movie.new("YOUR_API_KEY", "region")
movie.quota
# => 5500
```
Here are all the helper methods within this wrapper for the Movie and Tv classes:

#### Movie Helpers

```ruby
guidebox_movie = GuideboxWrapper::Movie.new("YOUR_API_KEY", "region")

guidebox_movie.search_for("star wars a new hope")
# => [{"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, ...}]

guidebox_movie.search_for_by_provider("star wars a new hope", "amazon_prime")
# => [{"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, ...}]

guidebox_movie.search_by_db_id(11, "themoviedb")
# => {"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, ...}

guidebox_movie.show_information("star wars a new hope")
# => {"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, "alternate_titles"=>["Star Wars", "Star Wars Episode IV - A New Hope", "Star Wars Episode 4 - A New Hope", "Star Wars Episode IV", "Star Wars 4", "Star Wars: Episode IV - A New Hope - Despecialized Edition", "Star Wars Episode IV: A New Hope", "Star Wars: Episode IV - A New Hope", "Star Wars: A New Hope", "Star Wars: A New Hope (Bonus Features)"], "imdb"=>"tt0076759", "pre_order"=>false, "release_date"=>"1977-05-25", "rating"=>"PG", "rottentomatoes"=>11292, "freebase"=>"/m/0dtfn", "wikipedia_id"=>52549, "metacritic"=>"http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope", "common_sense_media"=>nil, "overview"=>"Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.", ...}

guidebox_movie.cast("star wars a new hope")
# => [{"id"=>300791, "name"=>"Mark Hamill", "character_name"=>"Luke Skywalker"}, {"id"=>212668, "name"=>"Harrison Ford", "character_name"=>"Han Solo"}, {"id"=>577359, "name"=>"Carrie Fisher", "character_name"=>"Leia Organa"}, ...]

guidebox_movie.writers("star wars a new hope")
# => [{"id"=>527769, "name"=>"George Lucas"}] 

guidebox_movie.directors("star wars a new hope")
# => [{"id"=>527769, "name"=>"George Lucas"}] 

guidebox_movie.release_year("star wars a new hope")
# => 1977

guidebox_movie.release_date("star wars a new hope")
# => "1977-05-25"

guidebox_movie.rating("star wars a new hope")
# => "PG"

guidebox_movie.duration("star wars a new hope")
# => 7260

guidebox_movie.themoviedb_id("star wars a new hope")
# => 11

guidebox_movie.imdb_id("star wars a new hope")
# => "tt0076759"

guidebox_movie.rotten_tomatoes_id("star wars a new hope")
# => 11292

guidebox_movie.alternate_titles("star wars a new hope")
# => ["Star Wars", "Star Wars Episode IV - A New Hope", "Star Wars Episode 4 - A New Hope", "Star Wars Episode IV", "Star Wars 4", "Star Wars: Episode IV - A New Hope - Despecialized Edition", "Star Wars Episode IV: A New Hope", "Star Wars: Episode IV - A New Hope", "Star Wars: A New Hope", "Star Wars: A New Hope (Bonus Features)"] 

guidebox_movie.freebase("star wars a new hope")
# => "/m/0dtfn"

guidebox_movie.wikipedia_id("star wars a new hope")
# => 52549

guidebox_movie.metacritic_link("star wars a new hope")
# => "http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope"

guidebox_movie.overview("star wars a new hope")
# => "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire."

guidebox_movie.genres("star wars a new hope")
# => [{"id"=>3, "title"=>"Adventure"}, {"id"=>1, "title"=>"Action"}, {"id"=>21, "title"=>"Science-Fiction"}] 

guidebox_movie.tags("star wars a new hope")
# => [{"id"=>1594, "tag"=>"galaxy"}, {"id"=>9191, "tag"=>"hermit"}, {"id"=>2186, "tag"=>"star wars"}, {"id"=>9192, "tag"=>"death star"}, {"id"=>9193, "tag"=>"lightsaber"}, {"id"=>5558, "tag"=>"jedi"}, ...]

guidebox_movie.facebook_link("star wars revenge of the sith")
# => "https://www.facebook.com/pages/Star-Wars-Episode-III-Revenge-of-the-Sith/105663472799675"

guidebox_movie.web_trailers("star wars revenge of the sith")
# => [{"type"=>"Main Trailer", "source"=>"guidebox", "display_name"=>"Guidebox", "link"=>"http://www.guidebox.com/watch-now.php?video=53201", "embed"=>"http://api-widget.guidebox.com/embed.php?video=53201"}] 

guidebox_movie.ios_trailers("star wars revenge of the sith")
# => [{"type"=>"Main Trailer", "source"=>"guidebox", "display_name"=>"Guidebox", "link"=>"http://www.guidebox.com/watch-now.php?video=53201", "embed"=>"http://api-widget.guidebox.com/embed.php?video=53201"}] 

guidebox_movie.android_trailers("star wars revenge of the sith")
# => [{"type"=>"Main Trailer", "source"=>"guidebox", "display_name"=>"Guidebox", "link"=>"http://www.guidebox.com/watch-now.php?video=53201", "embed"=>"http://api-widget.guidebox.com/embed.php?video=53201"}] 

guidebox_movie.posters("star wars a new hope")
# => [{"large"=>{"url"=>"http://static-api.guidebox.com/022615/thumbnails_movies/-alt--55413-2929921416-5712237544-4512474872-large-400x570-alt-.jpg", "width"=>400, "height"=>570}, ...] 

guidebox_movie.thumbnail_images("star wars a new hope")
# => [{"xlarge"=>{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-608x342.jpg", "width"=>608, "height"=>342}, "large"=>{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/55413-4649667824-932900156-9715580251-448x252.jpg", "width"=>448, "height"=>252}, ...] 

guidebox_movie.banner_images("star wars a new hope")
# => [{"xlarge"=>{"url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-1300x240.jpg", "width"=>1300, "height"=>240}, "large"=>{"url"=>"http://static-api.guidebox.com/012915/movies/banners/55413-9158895025-3035124387-2547398284-1000x185.jpg", "width"=>1000, "height"=>185}, ...] 

guidebox_movie.background_images("star wars a new hope")
# => [{"original"=>{"url"=>"http://static-api.guidebox.com/012915/movies/backgrounds/55413-83836050721-144034282636-0.jpg", "width"=>1920, "height"=>1080}, "original_width"=>1920, "original_height"=>1080, "image_rating"=>0}, {"original"=>{"url"=>"http://static-api.guidebox.com/012915/movies/backgrounds/55413-206143594668-179262854890-0.jpg", "width"=>1920, "height"=>1080}, "original_width"=>1920, "original_height"=>1080, "image_rating"=>0}, {"original"=>{"url"=>"http://static-api.guidebox.com/012915/movies/backgrounds/55413-187622151929-44181177682-0.jpg", "width"=>1920, "height"=>1080}, "original_width"=>1920, "original_height"=>1080, "image_rating"=>0}]

guidebox_movie.free_web_sources("star wars a new hope")
# => []

guidebox_movie.free_ios_sources("star wars a new hope")
# => []

guidebox_movie.free_android_sources("star wars a new hope")
# => []

guidebox_movie.tv_everywhere_web_sources("godzilla")
# => [{"source"=>"xfinity_tveverywhere", "display_name"=>"Xfinity", "tv_channel"=>"Cinemax", "link"=>"http://xfinitytv.comcast.net/watch/Godzilla/7874134385186056112/574211139668/Godzilla-%28Cinemax%29/videos"}, ...] 

guidebox_movie.tv_everywhere_ios_sources("godzilla")
# => [{"source"=>"maxgo", "display_name"=>"MAX GO", "tv_channel"=>"Cinemax", "link"=>"maxgo://deeplink/MO.MO/MGOROSTGP38072", "app_name"=>"MAX GO", "app_link"=>1, "app_required"=>1, "app_download_link"=>"itms-apps://itunes.apple.com/app/max-go/id453560335"}] 

guidebox_movie.tv_everywhere_android_sources("godzilla")
# => [{"source"=>"maxgo", "display_name"=>"MAX GO", "tv_channel"=>"Cinemax", "link"=>"maxgo://deeplink/MO.MO/MGOROSTGP38072", "app_name"=>"MAX GO", "app_link"=>1, "app_required"=>1, "app_download_link"=>"https://play.google.com/store/apps/details?id=com.MAXGo"}] 

guidebox_movie.subscription_web_sources("star wars a new hope")
# => [{"source"=>"now_tv", "display_name"=>"NOW TV", "link"=>"http://watch.nowtv.com/watch-movies/star-wars-episode-iv-new-hope-1977/d3742a916796e410VgnVCM1000000b43150a____"}] 

guidebox_movie.purchase_web_sources("star wars a new hope")
# => [{"source"=>"itunes", "display_name"=>"iTunes", "link"=>"https://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481?uo=4&at=10laHb", "formats"=>[{"price"=>"19.99", "format"=>"SD", "type"=>"purchase", "pre_order"=>false}, {"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]}, ...]

guidebox_movie.purchase_ios_sources("star wars a new hope")
# => [{"source"=>"itunes", "display_name"=>"iTunes", "link"=>"itms://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481?uo=4&at=10laHb", "app_name"=>"iTunes", "app_link"=>1, "app_required"=>1, "app_download_link"=>"itms-apps://", "formats"=>[{"price"=>"19.99", "format"=>"SD", "type"=>"purchase", "pre_order"=>false}, {"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]}] 

guidebox_movie.purchase_android_sources("star wars a new hope")
# => [{"source"=>"google_play", "display_name"=>"Google Play", "link"=>"https://play.google.com/store/movies/details?id=yYNSSNJ0z_U", "app_name"=>"Google Play", "app_link"=>0, "app_required"=>0, "app_download_link"=>"https://play.google.com/store", "formats"=>[{"price"=>"19.99", "format"=>"HD", "type"=>"purchase", "pre_order"=>false}]}] 
```

#### Tv Helpers

```ruby
guidebox_tv = GuideboxWrapper::Tv.new("YOUR_API_KEY", "region")

guidebox_tv.search_for("entourage")
# => [{"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2004-07-18", "imdb_id"=>"tt0387199", ...}, ...] 

guidebox_tv.search_for_by_provider("entourage", "hbo")
# => [{"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2004-07-18", "imdb_id"=>"tt0387199", ...}, ...]

guidebox_tv.search_by_db_id("tt0387199", "imdb")
# => {"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2004-07-18", "imdb_id"=>"tt0387199", ...} 

guidebox_tv.show_information("entourage")
# => {"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "status"=>"Ended", "type"=>"television", "container_show"=>0, "first_aired"=>"2004-07-18", "network"=>"HBO", "channels"=>[{"id"=>36, "name"=>"HBO", "short_name"=>"hbo", ...}

guidebox_tv.seasons("entourage")
# => [{"season_number"=>1, "first_airdate"=>"2004-07-18"}, {"season_number"=>2, "first_airdate"=>"2005-06-05"}, {"season_number"=>3, "first_airdate"=>"2006-06-11"}, {"season_number"=>4, "first_airdate"=>"2007-06-17"}, ...]

guidebox_tv.cast("entourage")
# => [{"id"=>40080, "name"=>"Kevin Connolly", "character_name"=>"Eric Murphy"}, {"id"=>349611, "name"=>"Adrian Grenier", "character_name"=>"Vincent Chase"}, {"id"=>275528, "name"=>"Jerry Ferrara", "character_name"=>"Turtle"}, {"id"=>71709, "name"=>"Kevin Dillon", "character_name"=>"Johnny \"Drama\" Chase"}, {"id"=>491504, "name"=>"Jeremy Piven", "character_name"=>"Ari Gold"}, ...] 

guidebox_tv.status("entourage")
# => "Ended"

guidebox_tv.type("entourage")
# => "television"

guidebox_tv.first_aired("entourage")
# => "2004-07-18"

guidebox_tv.network("entourage")
# => "HBO"

guidebox_tv.channel_information("entourage")
# => [{"id"=>36, "name"=>"HBO", "short_name"=>"hbo", "channel_type"=>"television", "artwork_208x117"=>"http://static-api.guidebox.com/041014/thumbnails_small/36-4192732312-208x117-channel.jpg", ...}]

guidebox_tv.runtime("entourage")
# => 30

guidebox_tv.genres("entourage")
# => [{"id"=>6, "title"=>"Comedy"}, {"id"=>9, "title"=>"Drama"}] 

guidebox_tv.tags("entourage")
# => [{"id"=>919, "tag"=>"beverly hills"}, {"id"=>1624, "tag"=>"beverly hills california"}, {"id"=>44, "tag"=>"male friendship"}, {"id"=>293, "tag"=>"aspiring actor"}, {"id"=>295, "tag"=>"hollywood"}, ...]

guidebox_tv.overview("entourage")
# => "Vincent Chase is a young actor whose career is on the rise. Joining him on his journey to stardom are his childhood buddies Eric, Turtle, his brother Johnny Drama and his hot-tempered agent Ari Gold. Together, they'll navigate the highs and lows of Hollywood's fast lane, where the stakes are higher -- and the money and temptations greater -- than ever before. "

guidebox_tv.air_day_of_week("entourage")
# => "Sunday"

guidebox_tv.air_time("entourage")
# => "10:30 PM"

guidebox_tv.rating("entourage")
# => "TV-MA"

guidebox_tv.imdb_id("entourage")
# => "tt0387199"

guidebox_tv.metacritic_link("entourage")
# => "http://www.metacritic.com/tv/entourage"

guidebox_tv.wikipedia_id("entourage")
# => 907282

guidebox_tv.facebook_link("entourage")
# => "https://www.facebook.com/Entourage"

guidebox_tv.twitter_link("entourage")
# => nil

guidebox_tv.related_show("entourage")
# => {"total_results"=>6, "total_returned"=>6, "results"=>[{"id"=>300, "title"=>"Suits", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2011-06-23", "imdb_id"=>"tt1632701", "tvdb"=>247808, "themoviedb"=>37680, "freebase"=>"/m/0gg70vv", "wikipedia_id"=>30987670, "tvrage"=>{"tvrage_id"=>27518, "link"=>"http://www.tvrage.com/shows/id-27518"}, "artwork_208x117"=>"http://static-api.guidebox.com/091414/thumbnails_small/300-4352846579-208x117-show-thumbnail.jpg", "artwork_304x171"=>"http://static-api.guidebox.com/091414/thumbnails_medium/300-2030188479-304x171-show-thumbnail.jpg", "artwork_448x252"=>"http://static-api.guidebox.com/091414/thumbnails_large/300-9888987527-448x252-show-thumbnail.jpg", "artwork_608x342"=>"http://static-api.guidebox.com/091414/thumbnails_xlarge/300-9276088145-608x342-show-thumbnail.jpg"}, ...]} 

guidebox_tv.posters("entourage")
# => [{"xlarge"=>{"url"=>"http://static-api.guidebox.com/012915/shows/posters/6085-3725524591-5295090941-3912000982-600x855.jpg", "width"=>600, "height"=>855}, "large"=>{"url"=>"http://static-api.guidebox.com/012915/shows/posters/6085-3725524591-5295090941-3912000982-400x570.jpg", "width"=>400, "height"=>570}, ...}]

guidebox_tv.thumbnail_images("entourage")
# => [{"xlarge"=>{"url"=>"http://static-api.guidebox.com/091414/thumbnails_xlarge/6085-6340779560-608x342-show-thumbnail.jpg", "width"=>608, "height"=>342}, "large"=>{"url"=>"http://static-api.guidebox.com/091414/thumbnails_large/6085-6218685578-448x252-show-thumbnail.jpg", "width"=>448, "height"=>252}, ...}] 

guidebox_tv.banner_images("entourage")
# => [{"xlarge"=>{"url"=>"http://static-api.guidebox.com/012915/shows/banners/6085-6918728002-5154230813-6413012026-1300x240.jpg", "width"=>1300, "height"=>240}, "large"=>{"url"=>"http://static-api.guidebox.com/012915/shows/banners/6085-6918728002-5154230813-6413012026-1000x185.jpg", "width"=>1000, "height"=>185}, ...]

guidebox_tv.background_images("entourage")
# => [{"original"=>{"url"=>"http://static-api.guidebox.com/012915/shows/backgrounds/6085-96932638085-133215735918-888.jpg", "width"=>1280, "height"=>720}, "original_width"=>1280, "original_height"=>720, "image_rating"=>0}, ...] 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/GuideboxWrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
