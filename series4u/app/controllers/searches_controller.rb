class SearchesController < ApplicationController
	def index
	end
	def results
		if params[:search]
			@series = Serie.search_by_title(params[:search], current_user)
			@chapters = Chapter.search(params[:search], current_user)
		elsif params[:genre]
			@series = Serie.search(params[:title], params[:genre], current_user)
			@chapters = Chapter.search(params[:title], current_user)
		end
	end
end
