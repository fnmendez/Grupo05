class FavoriteSeriesController < ApplicationController
  before_action :set_favorite_series, only: [:show, :edit, :update, :destroy]

  # GET /favorite_series
  # GET /favorite_series.json
  def index
    @favorite_series = FavoriteSerie.all
  end

  # GET /favorite_series/1
  # GET /favorite_series/1.json
  def show
  end

  # GET /favorite_series/new
  def new
    @favorite_series = FavoriteSerie.new
    @favorite_series.user = current_user
    @favorite_series.serie = Serie.find(params[:series_id])
    respond_to do |format|
      if @favorite_series.save
        format.html { redirect_to @favorite_series.serie, notice: 'Serie was succesfully marked as favorite.' }
        format.json { render :show, status: :created, location: @favorite_series }
      else
        format.html { render :new }
        format.json { render json: @favorite_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /favorite_series/1/edit
  def edit
  end

  # POST /favorite_series
  # POST /favorite_series.json
  def create
    @favorite_series = FavoriteSerie.new(favorite_series_params)

    respond_to do |format|
      if @favorite_series.save
        format.html { redirect_to @favorite_series, notice: 'Favorite serie was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_series }
      else
        format.html { render :new }
        format.json { render json: @favorite_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_series/1
  # PATCH/PUT /favorite_series/1.json
  def update
    respond_to do |format|
      if @favorite_series.update(favorite_series_params)
        format.html { redirect_to @favorite_series, notice: 'Favorite serie was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_series }
      else
        format.html { render :edit }
        format.json { render json: @favorite_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_series/1
  # DELETE /favorite_series/1.json
  def destroy
    @favorite_series.destroy
    respond_to do |format|
      format.html { redirect_to @favorite_series.serie, notice: 'Serie was succesfully unmarked as favorite.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_series
      @favorite_series = FavoriteSerie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_series_params
      params.fetch(:favorite_series, {})
    end
end
