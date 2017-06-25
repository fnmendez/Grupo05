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

			if @to_sort == "series"

				if @criterio == "user"
					@series = @series.sort_by { |s| s.user.username}
				else
					@series = @series.sort_by { |s| s[@criterio.to_sym]}
				end

			elsif @to_sort == "chapters"
				if @criterio == "user"
					@chapters = @chapters.sort_by { |c| c.user.username }
				elsif @criterio == "from"
					@chapters = @chapters.sort_by { |c| c.season.serie.title }
				else
					@chapters = @chapters.sort_by { |c| c[@criterio.to_sym]}
				end
			end
		end
	end
end
