class ChartsController < ApplicationController

  def stats
    views = View.all.group_by { |view| view.chapter.serie.title }
    @views_serie = {}
    views.each do |key, array|
      @views_serie[key] = array.length
    end

    @stars_serie = {}

    stars = Chapter.all.group_by { |chapter| chapter.serie.title }
    stars.each do |key, array|
      @stars_serie[key] = array.sum { |chapter| chapter.average_rating}
    end
    

    ratings = SerieRating.all
    ratings = ratings.group_by { |rating| rating.serie.title }
    @ratings_serie = {}
    ratings.each do |key, array|
      @ratings_serie[key] = array.length
    end

  end

end
