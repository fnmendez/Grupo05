class ChartsController < ApplicationController

  def stats
    views = View.all
    views = views.group_by { |view| view.chapter.serie.title }

    @views_serie = {}

    views.each do |key, array|
      @views_serie[key] = array.length
    end

  end

end
