require 'GuideboxWrapper/query_builders/tv/tv_query_builders'
require 'GuideboxWrapper/tv/tv'

module GuideboxWrapper
  class GuideboxTv < GuideboxApi
    include TvQueryBuilders
    # Search for show
    def search_for(name)
      url = build_query(name)
      url += '/fuzzy/web'
      data = @client.query(url)
      sleep(1)
      data["results"]
    end

    # Search by provider
    def search_for_by_provider(name, provider)
      url = build_query(name)
      url += '/fuzzy/' + provider + "/web"
      data = @client.query(url)
      data["results"]
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

    def fetch_tv_show_by_db_id(id, type)
      url = @base_url + "/search/id/"
      case type
      when "tvdb"
        url += "tvdb/" + id.to_s
      when "themoviedb"
        url += "themoviedb/" + id.to_s
      when "imdb"
        url += "imdb/" + id
      else
        puts "That id type does not exist"
        return
      end
      id = @client.query(url)["id"]
      url = @base_url
      url += "/show/" + id.to_s
      results = @client.query(url)
      Tv.new(results)
    end

    # Get all tv show info
    def show_information(name)
      id = self.search_for(name).first["id"]
      url = @base_url
      url += "/show/" + id.to_s
      @client.query(url)
    end

    def fetch_tv_show(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s
      results = @client.query(url)
      Tv.new(results)
    end

    # Gets all tv show movie posters
    def posters(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/posters"
      results = @client.query(url)
      results["results"]["posters"]
    end

    # Gets all show thumbnail images by name or id
    def thumbnail_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/thumbnails"
      results = @client.query(url)
      results["results"]["thumbnails"]
    end

    # Gets all show banner images by name or id
    def banner_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/banners"
      results = @client.query(url)
      results["results"]["banners"]
    end

    # Gets all show background images by name or id
    def background_images(name_or_id)
      url = @base_url
      id = set_name_or_id(name_or_id)
      url += "/show/" + id.to_s + "/images/backgrounds"
      results = @client.query(url)
      results["results"]["backgrounds"]
    end
  end
end