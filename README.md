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

Keep in mind that Guidebox has some restrictions on the amount of API calls that can be made per month and per second. The API is limited to 100,000 API calls a month and 1 API call per second. The monthy limit of 100,000 will reset on the 1st of every month. 

Will be updated as soon as Gem is completed and pushed up to RubyGem Repo

The API helpers throughout this gem can be called on either Tv or Movie objects. These objects can be initialized by doing the following:

```ruby
GuideboxWrapper::Tv.new("YOUR_API_KEY", "region") # region can be "all", "US" (United States), "GB" (Great Britain), etc
GuideboxWrapper::Movie.new("YOUR_API_KEY", "region")
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
