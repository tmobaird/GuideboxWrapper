require 'pry'
require 'json'
require 'open-uri'

module GuideboxWrapper
  class Client
    def query(url)
      JSON.parse(open(url).read)
    end
  end
  class GuideboxApi
    def initialize(key, region)
      @key = key
      @region = region
      @base_url = "http://api-public.guidebox.com/v1.43/#{region}/#{key}"
      @client = Client.new
    end

  end
end