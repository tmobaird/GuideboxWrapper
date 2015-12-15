module GuideboxWrapper
  class Tv < GuideboxApi
    # Search for show
    def search_for(name)
      url = build_query(name)
      url += '/fuzzy/web'
      data = @client.query(url)
      results = data["results"]
    end

    # Search by provider
    def search_for_by_provider(name, provider)
      url = build_query(name)
      url += '/fuzzy/' + provider + "/web"
      data = @client.query(url)
      results = data["results"]
    end

    # Search for show by external db id
    def search_by_db_id(id, type)
      url = @base_url
      url += "/search/id/"
      case type
      when "tvdb"
        url += "tvdb/"
        url += id.to_s
      when "themoviedb"
        url += "themoviedb/"
        url += id.to_s
      when "imdb"
        url += "imdb/"
        url += id
      else
        puts "That id type does not exist"
        return
      end
      @client.query(url)
    end

    # Get all tv show info
    def show_information(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      @client.query(url)
    end

    # Get all seasons of show by name
    def seasons(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s + "/seasons"
      data = @client.query(url)
      data["results"]
    end

    # Get the cast of show by show name
    def cast(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["cast"]
    end

    # Get the status of show by name ex. Ended
    def status(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["status"]
    end

    # Get type of show by name ex. TV
    def type(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["type"]
    end

    # Get show first aired date by name
    def first_aired(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["first_aired"]
    end

    # Get network aired on, ex HBO
    def network(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["network"]
    end

    # Get channel information of show by name
    def channel_information(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["channels"]
    end

    # Get runtime of show by name
    def runtime(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["runtime"]
    end

    # Get genres of show by show name ex. Drama, Comedy
    def genres(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["genres"]
    end

    # Get tags of show by name
    def tags(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["tags"]
    end

    # Get overview or description of show by name
    def overview(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["overview"]
    end

    # Get air day of the week by show name
    def air_day_of_week(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["air_day_of_week"]
    end

    # Get air time of the day by show name
    def air_time(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["air_time"]
    end

    # Get show rating by name ex. TV-MA
    def rating(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["rating"]
    end

    # Get imdb id by show name
    def imdb_id(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["imdb_id"]
    end

    # Get metacritic link by show name
    def metacritic_link(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["metacritic"]
    end

    # Get wikipedia id by show name
    def wikipedia_id(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["wikipedia_id"]
    end

    # Get facebook_link by show name
    def facebook_link(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["social"]["facebook"]["link"]
    end

    # Get twitter_link by name
    def twitter_link(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["social"]["twitter"]["link"]
    end

    # Gets all related tv shows by show id
    def related_shows(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s + "/related"
      @client.query(url)
    end

    # Gets all tv show movie posters
    def posters(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/posters"
      @client.query(url)
    end

    # Gets all show thumbnail images by name or id
    def thumbnail_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/thumbnails"
      @client.query(url)
    end

    # Gets all show banner images by name or id
    def banner_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/banners"
      @client.query(url)
    end

    # Gets all show background images by name or id
    def background_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/backgrounds"
      @client.query(url)
    end

    private

    def build_query(name)
      url = @base_url
      words = name.split(" ")
      url += "/search/title/"
      for word in words
        url += word
        unless word == words.last
          url += "+"
        end
      end
      url
    end

    def search_and_set_url(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
    end

    def set_name_or_id(name_or_id)
      if name_or_id.is_a?(String)
        id = self.search_for(name_or_id).first["id"]
      else
        id = name_or_id
      end
      id
    end
  end
end