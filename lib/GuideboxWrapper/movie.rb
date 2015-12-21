require 'GuideboxWrapper/query_builders/movie/movie_query_builders'

module GuideboxWrapper
  class Movie < GuideboxApi
    include MovieQueryBuilders
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
      url += '/fuzzy/' + provider + '/web'
      data = @client.query(url)
      results = data["results"]
    end

    def search_by_db_id(id, type)
      url = @base_url
      url += "/search/movie/id/"
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

    def show_information(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/movie/" + id.to_s
      @client.query(url)
    end

    def cast(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["cast"]
    end

    def writers(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["writers"]
    end

    def directors(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["directors"]
    end

    def release_year(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["release_year"]
    end

    def release_date(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["release_date"]
    end

    def rating(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["rating"]
    end

    def duration(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["duration"]
    end

    def themoviedb_id(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["themoviedb"]
    end 

    def imdb_id(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["imdb"]
    end

    def rotten_tomatoes_id(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["rottentomatoes"]
    end

    def alternate_titles(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["alternate_titles"]
    end

    def freebase(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["freebase"]
    end

    def wikipedia_id(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["wikipedia_id"] 
    end

    def metacritic_link(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["metacritic"]
    end

    def overview(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["overview"]
    end

    def genres(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["genres"]
    end

    def tags(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["tags"]
    end

    def facebook_link(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["social"]["facebook"]["link"]
    end

    def web_trailers(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["trailers"]["web"]
    end

    def ios_trailers(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["trailers"]["ios"]
    end

    def android_trailers(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["trailers"]["android"]
    end

    def posters(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/movie/" + id.to_s + "/images/posters"
      puts url
      @client.query(url)
    end

    def thumbnail_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/movie/" + id.to_s + "/images/thumbnails"
      puts url
      @client.query(url)
    end

    def banner_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/movie/" + id.to_s + "/images/banners"
      puts url
      @client.query(url)
    end

    def background_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/movie/" + id.to_s + "/images/backgrounds"
      puts url
      @client.query(url)
    end

    def free_web_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["free_web_sources"]
    end

    def free_ios_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["free_ios_sources"]
    end

    def free_android_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["free_android_sources"]
    end

    def tv_everywhere_web_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["tv_everywhere_web_sources"]
    end

    def tv_everywhere_ios_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["tv_everywhere_ios_sources"]
    end

    def tv_everywhere_android_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["tv_everywhere_android_sources"]
    end

    def subscription_web_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["subscription_web_sources"]
    end

    def purchase_web_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["purchase_web_sources"]
    end

    def purchase_ios_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["purchase_ios_sources"]
    end

    def purchase_android_sources(name)
      url = search_and_set_url(name)
      results = @client.query(url)
      results["purchase_android_sources"]
    end
  end
end