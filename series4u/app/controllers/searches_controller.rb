class SearchesController < ApplicationController
	def index
	end
	def results
		if params[:search]
			@title = params[:search]
			@genre = ""
			@series = Serie.search_by_title(params[:search], current_user)
			@chapters = Chapter.search(params[:search], current_user)
		end
		if params[:genre]
			@title = params[:title]
			@genre = params[:genre]
			@series = Serie.search(params[:title], params[:genre], current_user)
			@chapters = Chapter.search(params[:title], current_user)
		end
		if params[:sort]
			@series = Serie.search(params[:title], params[:genre], current_user)
			@chapters = Chapter.search(params[:title], current_user)
			@to_sort = params[:sort].split("-")[0]
			@criterio = params[:sort].split("-")[1]
			if @criterio == "user"
				@criterio = "user.username"
			end
			if  @criterio == "from"
				@criterio = "season.serie.title"
			end
			@criterio = @criterio.to_sym
			if @to_sort == "series"
				@series = @series.sort_by { |s| s[@criterio] }
			elsif @to_sort == "chapters"
				@chapters = @chapters.sort_by { |c| c[@criterio] }
			end
		end
	end
end
