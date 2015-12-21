module TvQueryBuilders
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
    url + "/show/" + id.to_s
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