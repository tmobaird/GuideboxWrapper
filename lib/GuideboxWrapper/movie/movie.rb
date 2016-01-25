module GuideboxWrapper
	class Movie 
		attr_reader :id, :title, :release_year, :cast, :writers, :directors, :release_date, :rating, :duration, :themoviedb, :imdb, :rottentomatoes, :alternate_titles, :freebase, :wikipedia_id, :metacritic, :overview, :genres, :tags, :facebook_link, :web_trailers, :ios_trailers, :android_trailers, :free_web_sources, :free_ios_sources, :free_android_sources, :tv_everywhere_web_sources, :tv_everywhere_ios_sources, :tv_everywhere_android_sources, :subscription_web_sources, :purchase_web_sources, :purchase_ios_sources, :purchase_android_sources, :posters, :backgrounds, :banners, :thumbnails

		def initialize(movie_info, images)
			excluded_keys = ["common_sense_media", "poster_120x171", "poster_240x342", "poster_400x570", "social", "trailers"]
			movie_info.each do |key, value|
				unless excluded_keys.include?(key)
    				instance_variable_set("@#{key}", value)
    			end
  			end
			@facebook_link = movie_info["social"]["facebook"]["link"]
			@web_trailers = movie_info["trailers"]["web"]
			@ios_trailers = movie_info["trailers"]["ios"]
			@android_trailers = movie_info["trailers"]["android"]
			@posters = images["posters"]
		    @backgrounds = images["backgrounds"]
		    @banners = images["banners"]
		    @thumbnails = images["thumbnails"]
		end

		def large_posters
			lg_posters ||= []
			for poster in @posters
				lg_posters << poster["large"]
			end
			lg_posters
		end

		def medium_posters
			md_posters ||= []
			for poster in @posters
				md_posters << poster["medium"]
			end
			md_posters
		end

		def small_posters 
			sm_posters ||= []
			for poster in @posters 
				sm_posters << poster["small"]
			end
			sm_posters
		end

		def xlarge_banners
			xlg_banners ||= []
			for banner in @banners
				xlg_banners << banner["xlarge"]
			end
			xlg_banners
		end

		def large_banners
			lg_banners ||= []
			for banner in @banners
				lg_banners << banner["large"]
			end
			lg_banners
		end

		def medium_banners
			md_banners ||= []
			for banner in @banners
				md_banners << banner["medium"]
			end
			md_banners
		end

		def small_banners
			sm_banners ||= []
			for banner in @banners
				sm_banners << banner["small"]
			end
			sm_banners
		end

		def xlarge_thumbnails
			xlg_thumbnails ||= []
			for thumbnail in @thumbnails
				xlg_thumbnails << thumbnail["xlarge"]
			end
			xlg_thumbnails
		end

		def large_thumbnails
			lg_thumbnails ||= []
			for thumbnail in @thumbnails
				lg_thumbnails << thumbnail["large"]
			end
			lg_thumbnails
		end

		def medium_thumbnails
			md_thumbnails ||= []
			for thumbnail in @thumbnails
				md_thumbnails << thumbnail["medium"]
			end
			md_thumbnails
		end

		def small_thumbnails
			sm_thumbnails ||= []
			for thumbnail in @thumbnails
				sm_thumbnails << thumbnail["small"]
			end
			sm_thumbnails
		end
	end
end