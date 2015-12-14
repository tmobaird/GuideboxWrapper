module GuideboxWrapper
  class Tv < GuideboxApi
    # Search for show
    def search_for(name)
      url = @base_url
      words = name.split(" ")
      url += "/search/title/"
      for word in words
        url += word
        unless word == words.last
          url += "+"
        end
      end
      url += '/fuzzy/web'
      puts url
      data = @client.query(url)
      results = data["results"]
    end

    # Search by provider
    def search_for_by_provider(name, provider)
      url = @base_url
      words = name.split(" ")
      url += "/search/title/"
      for word in words
        url += word
        unless word == words.last
          url += "+"
        end
      end
      url += '/fuzzy'
      url += '/' + provider
      url += '/web'
      puts url
      data = @client.query(url)
      results = data["results"]
    end

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
      puts url
      @client.query(url)
    end

    def seasons(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s + "/seasons"
      puts url
      data = @client.query(url)
      data["results"]
    end

    def cast(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      puts url
      results = @client.query(url)
      results["cast"]
    end

    def status(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      puts url
      results = @client.query(url)
      results["status"]
    end

    def type(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      puts url
      results = @client.query(url)
      results["type"]
    end

    def first_aired(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      puts url
      results = @client.query(url)
      results["first_aired"]
    end

    def network(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      puts url
      results = @client.query(url)
      results["network"]
    end

    def channel_information(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      puts url
      results = @client.query(url)
      results["channels"]
    end

    # def channel_images(name, guidebox)
    #   id = guidebox.search_for(name).first["id"]
    #   puts id
    #   url = @base_url
    #   url += "/show/" + id.to_s
    #   puts url
    #   results = @client.query(url)
    #   results["channels"]
    # end

    def runtime(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["runtime"]
    end

    def genres(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["genres"]
    end

    def tags(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["tags"]
    end

    def overview(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["overview"]
    end

    def air_day_of_week(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["air_day_of_week"]
    end

    def air_time(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["air_time"]
    end

    def rating(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["rating"]
    end

    def imdb_id(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["imdb_id"]
    end

    def metacritic_link(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["metacritic"]
    end

    def wikipedia_id(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["wikipedia_id"]
    end

    def facebook_link(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["social"]["facebook"]["link"]
    end

    def twitter_link(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s 
      puts url
      results = @client.query(url)
      results["social"]["twitter"]["link"]
    end

    # Gets all related tv shows by show id
    def related_shows(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s + "/related"
      puts url
      @client.query(url)
    end

    # Gets all tv show movie posters
    def posters(name_or_id)
      url = @base_url
      if name_or_id.is_a?(String)
        id = self.search_for(name_or_id).first["id"]
      else
        id = name_or_id
      end
      url += "/show/" + id.to_s + "/images/posters"
      puts url
      @client.query(url)
    end

    def thumbnail_images(name_or_id)
      url = @base_url
      if name_or_id.is_a?(String)
        id = self.search_for(name_or_id).first["id"]
      else
        id = name_or_id
      end
      url += "/show/" + id.to_s + "/images/thumbnails"
      puts url
      @client.query(url)
    end

    def banner_images(name_or_id)
      url = @base_url
      if name_or_id.is_a?(String)
        id = self.search_for(name_or_id).first["id"]
      else
        id = name_or_id
      end
      url += "/show/" + id.to_s + "/images/banners"
      puts url
      @client.query(url)
    end

    def background_images(name_or_id)
      url = @base_url
      if name_or_id.is_a?(String)
        id = self.search_for(name_or_id).first["id"]
      else
        id = name_or_id
      end
      url += "/show/" + id.to_s + "/images/backgrounds"
      puts url
      @client.query(url)
    end
  end
end