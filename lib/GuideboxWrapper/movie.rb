module GuideboxWrapper
	class Movie < GuideboxApi
		# Search for show
		def search_for(name)
			url = @base_url
			words = name.split(" ")
			url += "/search/movie/title/"
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
			url += "/search/movie/title/"
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
			@client.query(url)
			results = data["results"]
		end

		def search_by_db_id(id, type)
			url = @base_url
			url += "/search/movie/id/"
			case type
			when tvdb
				url += "tvdb/"
			when themoviedb
				url += "themoviedb/"
			when imdb
				url += "imdb/"
			else
				puts "That id type does not exist"
				return
			end
			url += id.to_s
			@client.query(url)
			results = data["results"]
		end

		def show_info(name, guidebox)
			id = guidebox.search_for(name).first["id"]
			puts id
			url = @base_url
			url += "/movie/" + id.to_s
			puts url
			@client.query(url)
		end

		def posters(name_or_id, guidebox)
			url = @base_url
			if name_or_id.is_a?(String)
				id = guidebox.search_for(name_or_id).first["id"]
				puts id
			else
				id = name_or_id
			end
			url += "/movie/" + id.to_s + "/images/posters"
			puts url
			@client.query(url)
		end

		def thumbnail_images(name_or_id, guidebox)
			url = @base_url
			if name_or_id.is_a?(String)
				id = guidebox.search_for(name_or_id).first["id"]
				puts id
			else
				id = name_or_id
			end
			url += "/movie/" + id.to_s + "/images/thumbnails"
			puts url
			@client.query(url)
		end

		def banner_images(name_or_id, guidebox)
			url = @base_url
			if name_or_id.is_a?(String)
				id = guidebox.search_for(name_or_id).first["id"]
				puts id
			else
				id = name_or_id
			end
			url += "/movie/" + id.to_s + "/images/banners"
			puts url
			@client.query(url)
		end

		def background_images(name_or_id, guidebox)
			url = @base_url
			if name_or_id.is_a?(String)
				id = guidebox.search_for(name_or_id).first["id"]
				puts id
			else
				id = name_or_id
			end
			url += "/movie/" + id.to_s + "/images/backgrounds"
			puts url
			@client.query(url)
		end
	end
end