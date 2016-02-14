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
GuideboxWrapper::GuideboxTv.new("YOUR_API_KEY", "region") # region can be "all", "US" (United States), "GB" (Great Britain), etc

GuideboxWrapper::GuideboxMovie.new("YOUR_API_KEY", "region") # region can be "all", "US" (United States), "GB" (Great Britain), etc
```

Keep in mind that Guidebox has some restrictions on the amount of API calls that can be made per month and per second. The API is limited to 100,000 API calls a month and 1 API call per second. The monthy limit of 100,000 resets on the 1st of every month. To check the amont of API calls you have made in the current month use the quota helper. It can be called on either a GuideboxWrapper::Movie Or GuideboxWrapper::Tv object as follows:

```ruby
tv = GuideboxWrapper::GuideboxTv.new("YOUR_API_KEY", "region")
tv.quota
# => 5500

movie = GuideboxWrapper::GuideboxMovie.new("YOUR_API_KEY", "region")
movie.quota
# => 5500
```
Here are all the helper methods within this wrapper for the Movie and Tv classes:

#### Movie Helpers

```ruby
guidebox_movie = GuideboxWrapper::GuideboxMovie.new("YOUR_API_KEY", "region")

# Returns an array of results in search by movie title
guidebox_movie.search_for("star wars a new hope")
# => [{"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, ...}]

# Returns an array of results in search by movie title and provider
guidebox_movie.search_for_by_provider("star wars a new hope", "amazon_prime")
# => [{"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, ...}]

guidebox_movie.search_by_db_id(11, "themoviedb")
# => {"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, ...}

guidebox_movie.show_information("star wars a new hope")
# => {"id"=>55413, "title"=>"Star Wars: Episode IV: A New Hope", "release_year"=>1977, "themoviedb"=>11, "alternate_titles"=>["Star Wars", "Star Wars Episode IV - A New Hope", "Star Wars Episode 4 - A New Hope", "Star Wars Episode IV", "Star Wars 4", "Star Wars: Episode IV - A New Hope - Despecialized Edition", "Star Wars Episode IV: A New Hope", "Star Wars: Episode IV - A New Hope", "Star Wars: A New Hope", "Star Wars: A New Hope (Bonus Features)"], "imdb"=>"tt0076759", "pre_order"=>false, "release_date"=>"1977-05-25", "rating"=>"PG", "rottentomatoes"=>11292, "freebase"=>"/m/0dtfn", "wikipedia_id"=>52549, "metacritic"=>"http://www.metacritic.com/movie/star-wars-episode-iv---a-new-hope", "common_sense_media"=>nil, "overview"=>"Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.", ...}

guidebox_movie.fetch_movie("star wars a new hope")
# => <Movie>

guidebox_movie.fetch_movie_by_db_id("tt0076759", "imdb")
# => <Movie>
# The first parameter is the external database id (if imdb the id should be a string, if themoviedb it should be an integer)
```

#### Accessbile Movie Attributes

```ruby
:id, :title, :release_year, :cast, :writers, :directors, :release_date, :rating, :duration, :themoviedb, :imdb,
:rottentomatoes, :alternate_titles, :freebase, :wikipedia_id, :metacritic_link, :overview, :genres, :tags, :facebook_link,
:web_trailers, :ios_trailers, :android_trailers, :free_web_sources, :free_ios_sources, :free_android_sources, :tv_everywhere_web_sources,
:tv_everywhere_ios_sources, :tv_everywhere_android_sources, :subscription_web_sources, :purchase_web_sources, :purchase_ios_sources,
:purchase_android_sources, :posters, :backgrounds, :banners, :thumbnails
```
These can be easily accessed as follows:
```ruby
guidebox_movie = GuideboxWrapper::GuideboxMovie.new("YOUR_API_KEY", "region")
movie = guidebox_movie.fetch_movie("star wars a new hope")

movie.title 
# => "Star Wars: Episode IV: A New Hope"

movie.rating
# => "PG"

movie.cast 
# => [{"id"=>300791, "name"=>"Mark Hamill", "character_name"=>"Luke Skywalker"}, {"id"=>212668, "name"=>"Harrison Ford", "character_name"=>"Han Solo"}, {"id"=>577359, "name"=>"Carrie Fisher", "character_name"=>"Leia Organa"}, {"id"=>485272, "name"=>"Peter Cushing", "character_name"=>"Grand Moff Tarkin"}, {"id"=>532256, "name"=>"Alec Guinness", "character_name"=>"Obi-Wan Kenobi"}, {"id"=>491391, "name"=>"Anthony Daniels", "character_name"=>"C-3PO"}, {"id"=>153815, "name"=>"Kenny Baker", "character_name"=>"R2-D2"}, {"id"=>274194, "name"=>"Peter Mayhew", "character_name"=>"Chewbacca"}, ...]
```

All Images (posters, backgrounds, banners, thumbnails) must first be set before they can be accessed. Due to the fact that is takes an extra Guidebox query to retrieve all the images, they are not initially set to minimize the amount of required queries. To set the images for a movie object, simply do the following:
```ruby
movie.images=(<Your API key>)
```
This will allow you to retrieve the proper values from the following methods:
```ruby
movie.large_posters
# => [{"url"=>"http://static-api.guidebox.com/thumbnails_movies/35899-7025719867-6648234203-7915630294-large-400x570.jpg", "width"=>400, "height"=>570}, ...]
movie.medium_posters
# => [{"url"=>"http://static-api.guidebox.com/thumbnails_movies_medium/35899-1790661379-2837163895-8028762201-medium-240x342.jpg", "width"=>240, "height"=>342}, ...]
movie.small_posters
# => [{"url"=>"http://static-api.guidebox.com/thumbnails_movies_small/35899-6837106645-4376499262-8650679979-small-120x171.jpg", "width"=>120, "height"=>171}, ...]
movie.xlarge_banners
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/banners/35899-9631411582-5908639450-2857491984-1300x240.jpg", "width"=>1300, "height"=>240}, ...]
movie.large_banners
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/banners/35899-9631411582-5908639450-2857491984-1000x185.jpg", "width"=>1000, "height"=>185}, ...]
movie.medium_banners
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/banners/35899-9631411582-5908639450-2857491984-756x140.jpg", "width"=>756, "height"=>140}, ...]
movie.small_banners
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/banners/35899-9631411582-5908639450-2857491984-551x102.jpg", "width"=>551, "height"=>102}, ...]
movie.xlarge_thumbnails
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/35899-3488454409-126609994-9253611676-608x342.jpg", "width"=>608, "height"=>342}, ...]
movie.large_thumbnails
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/35899-3488454409-126609994-9253611676-448x252.jpg", "width"=>448, "height"=>252}, ...]
movie.medium_thumbnails
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/35899-3488454409-126609994-9253611676-304x171.jpg", "width"=>304, "height"=>171}, ...]
movie.small_thumbnails
# => [{"url"=>"http://static-api.guidebox.com/012915/movies/thumbnails/35899-3488454409-126609994-9253611676-208x117.jpg", "width"=>208, "height"=>117}, ...]
```

#### Tv Helpers

```ruby
guidebox_tv = GuideboxWrapper::GuideboxTv.new("YOUR_API_KEY", "region")

guidebox_tv.search_for("entourage")
# => [{"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2004-07-18", "imdb_id"=>"tt0387199", ...}, ...] 

guidebox_tv.search_for_by_provider("entourage", "hbo")
# => [{"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2004-07-18", "imdb_id"=>"tt0387199", ...}, ...]

guidebox_tv.search_by_db_id("tt0387199", "imdb")
# => {"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "container_show"=>0, "first_aired"=>"2004-07-18", "imdb_id"=>"tt0387199", ...} 

guidebox_tv.fetch_tv_show_by_db_id("tt0387199", "imdb")
# => <Movie>

guidebox_tv.show_information("entourage")
# => {"id"=>6085, "title"=>"Entourage", "alternate_titles"=>[], "status"=>"Ended", "type"=>"television", "container_show"=>0, "first_aired"=>"2004-07-18", "network"=>"HBO", "channels"=>[{"id"=>36, "name"=>"HBO", "short_name"=>"hbo", ...}

guidebox_tv.fetch_tv_show("entourage")
# => <Movie>
```

#### Accessbile Tv Attributes

```ruby
:id, :title, :alternative_titles, :status, :first_aired, :network, 
:channels, :runtime, :genres, :tags, :cast, :overview, :air_day_of_week, 
:air_time, :rating, :imdb_id, :tvdb, :themoviedb, :freebase, :tv_com, 
:metacritic, :wikipedia_id, :tvrage, :fanart, :poster, :banner, :url, 
:artwork, :social, :seasons, :season_total, :related, 
:posters, :banners, :thumbnails, :backgrounds
```

These can easily be accessed as follows:
```ruby
guidebox_tv = GuideboxWrapper::GuideboxTv.new("YOUR_API_KEY", "region")
show = guidebox_tv.fetch_movie("entourage")

show.title 
# => "Entourage"

show.status
# => "Ended"

show.rating
# => "TV-MA"
```

All Images (posters, backgrounds, banners, thumbnails), Season Information, Accessible Sources, and Related Shows must first be set before they can be accessed. Due to the fact that is takes an extra Guidebox query to retrieve all the images, they are not initially set to minimize the amount of required queries. To set the images for a movie object, simply do the following:
```ruby
show.images=(<Your API key>)
show.seasons=(<Your API key>)
show.sources=(<Your API key>)
show.related=(<Your API key>)
```

This will allow you to retrieve the proper values from the following methods:
```ruby
show.seasons
show.season_total
show.related
show.posters
show.banners
show.thumbnails
show.backgrounds
show.web_sources
show.ios_sources
show.android_sources
show.free_sources
show.subscription_sources
show.purchase_sources
show.small_artwork
show.medium_artwork
show.large_artwork
show.xlarge_artwork
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
