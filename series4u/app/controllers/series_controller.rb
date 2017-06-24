class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  # GET /series
  # GET /series.json
  def index
    @series = Serie.viewable_series(current_user)
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @serie = Serie.find(params[:id])
    @serie_reviews = SerieReview.where(serie: @serie)
    imdb = FilmBuff.new(ssl:false)
    search = imdb.search_for_title(@serie.title, types: %w(title_popular))
    @imdb_result = nil
    if search.length > 0
      @imdb_result = imdb.look_up_id(search[0][:imdb_id])
    end
  end

  # GET /series/new
  def new
    @serie = Serie.new
  end

  # GET /series/1/edit
  def edit
    @serie = Serie.find(params[:id])
  end

  # POST /series
  # POST /series.json
  def create
    @serie = Serie.new(series_params)

    respond_to do |format|
      if @serie.save
        format.html { redirect_to @serie, notice: 'Serie was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Serie was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_index_path, notice: 'Serie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def share
    @serie = Serie.find(params[:id])
    SerieMailer.share_serie_mail(@serie, current_user, params[:share][:email]).deliver_later
    redirect_to @serie
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Serie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:serie).permit(:title, :country, :genre, :picture).merge({user: current_user})
    end
end
