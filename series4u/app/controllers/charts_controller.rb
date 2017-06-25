class ChartsController < ApplicationController

  def stats
    unless user_signed_in? && current_user.is_admin?
      redirect_to '/user_stats'
    end
    views = View.all.group_by { |view| view.chapter.serie.title }
    @views_serie = {}
    views.each do |key, array|
      @views_serie[key] = array.length
    end
    @views_serie = @views_serie.sort_by {|k, v| -v}[0..9]

    @stars_serie = {}
    stars = Chapter.all.group_by { |chapter| chapter.serie.title }
    stars.each do |key, array|
      rating_sum = array.sum { |chapter| chapter.average_rating }
      if rating_sum > 0
        @stars_serie[key] = rating_sum / array.sum { |chapter| chapter.average_rating > 0? 1:0 }
      end
    end
    @stars_serie_best = @stars_serie.sort_by {|k, v| -v }[0..9]
    @stars_serie_worst = @stars_serie.sort_by { |k, v| v}[0..9]

    u_views = View.all.group_by { |view| view.user.username }
    @user_views = {}
    u_views.each do |key, array|
      @user_views[key] = array.length
    end

    @user_contrib = Hash.new(0)
    Chapter.all.each do |chapter|
      @user_contrib[chapter.user.username] += 1
    end
    @user_contrib = @user_contrib.sort_by {|k, v| -v}[0..9]

  end

  def user_stats
    unless user_signed_in?
      redirect_to root_path
    end
    series = Chapter.all.group_by { |chapter| chapter.serie.title }
    @series_favs = {}
    series.each do |key, array|
      @series_favs[key] = array.sum { |chapter| chapter.favorite_chapters.where(user: current_user).count }
    end
    @series_favs = @series_favs.sort_by {|k, v| -v}[0..9]

    @top_genres = Hash.new(0)
    current_user.views.each do |view|
      genres = view.chapter.serie.genre.split(/[,\/]/).map(&:strip)
      genres.each do |genre|
        @top_genres[genre] += 1
      end
    end
    @top_genres = @top_genres.sort_by {|k,v| -v}[0..9]


  end


end
