class FavoritesController < ApplicationController
	def show
		@favorite_series = FavoriteSerie.where(user: current_user)
		@favorite_chapters = FavoriteChapter.where(user: current_user)
	end
end
