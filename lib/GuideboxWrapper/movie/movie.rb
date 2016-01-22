module GuideboxWrapper
	class Movie 
		attr_reader :id, :title, :release_year, :cast, :writers, :directors, :release_date, :rating, :duration, :themoviedb_id, :imdb_id, :rotten_tomatoes_id, :alternate_titles, :freebase, :wikipedia_id, :metacritic_link, :overview, :genres, :tags, :facebook_link, :web_trailers, :ios_trailers, :android_trailers, :free_web_sources, :free_ios_sources, :free_android_sources, :tv_everywhere_web_sources, :tv_everywhere_ios_sources, :tv_everywhere_android_sources, :subscription_web_sources, :purchase_web_sources, :purchase_ios_sources, :purchase_android_sources

		def initialize(movie_info)
			@id = movie_info["id"]
			@title = movie_info["title"]
			@release_year = movie_info["release_year"]
			@cast = movie_info["cast"]
			@writers = movie_info["writers"]
			@directors = movie_info["directors"]
			@release_date = movie_info["release_date"]
			@rating = movie_info["rating"]
			@duration = movie_info["duration"]
			@themoviedb_id = movie_info["themoviedb"]
			@imdb_id = movie_info["imdb"]
			@rotten_tomatoes_id = movie_info["rottentomatoes"]
			@alternate_titles = movie_info["alternate_titles"]
			@freebase = movie_info["freebase"]
			@wikipedia_id = movie_info["wikipedia_id"]
			@metacritic_link = movie_info["metacritic"]
			@overview = movie_info["overview"]
			@genres = movie_info["genres"]
			@tags = movie_info["tags"]
			@facebook_link = movie_info["social"]["facebook"]["link"]
			@web_trailers = movie_info["trailers"]["web"]
			@ios_trailers = movie_info["trailers"]["ios"]
			@android_trailers = movie_info["trailers"]["android"]
			@free_web_sources = movie_info["free_web_sources"]
			@free_ios_sources = movie_info["free_ios_sources"]
			@free_android_sources = movie_info["free_android_sources"]
			@tv_everywhere_web_sources = movie_info["tv_everywhere_web_sources"]
			@tv_everywhere_ios_sources = movie_info["tv_everywhere_ios_sources"]
			@tv_everywhere_android_sources = movie_info["tv_everywhere_android_sources"]
			@subscription_web_sources = movie_info["subscription_web_sources"]
			@purchase_web_sources = movie_info["purchase_web_sources"]
			@purchase_ios_sources = movie_info["purchase_ios_sources"]
			@purchase_android_sources = movie_info["purchase_android_sources"]
		end
	end
end