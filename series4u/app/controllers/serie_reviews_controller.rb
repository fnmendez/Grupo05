class SerieReviewsController < ApplicationController
  before_action :set_serie_review, only: [:show, :edit, :update, :destroy]

  # GET /serie_reviews
  # GET /serie_reviews.json
  def index
    @serie_reviews = SerieReview.all
  end

  # GET /serie_reviews/1
  # GET /serie_reviews/1.json
  def show
  end

  # GET /serie_reviews/new
  def new
    @serie = Serie.find(params[:series_id])
    @serie_review = SerieReview.new
  end

  # GET /serie_reviews/1/edit
  def edit
    @serie_review = SerieReview.find(params[:id])
    @serie = @serie_review.serie
  end

  # POST /serie_reviews
  # POST /serie_reviews.json
  def create
    @serie_review = SerieReview.new(serie_review_params)
    @serie_review.user = current_user
    @serie_review.serie = Serie.find(params[:series_id])

    respond_to do |format|
      if @serie_review.save
        format.html { redirect_to @serie_review.serie, notice: 'Serie review was successfully created.' }
        format.json { render :show, status: :created, location: @serie_review }
      else
        format.html { render :new }
        format.json { render json: @serie_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serie_reviews/1
  # PATCH/PUT /serie_reviews/1.json
  def update
    @serie = @serie_review.serie
    respond_to do |format|
      if @serie_review.update(serie_review_params)
        format.html { redirect_to @serie, notice: 'Serie review was successfully updated.' }
        format.json { render :show, status: :ok, location: @serie_review }
      else
        format.html { render :edit }
        format.json { render json: @serie_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serie_reviews/1
  # DELETE /serie_reviews/1.json
  def destroy
    @serie_review.destroy
    @serie = @serie_review.serie
    respond_to do |format|
      format.html { redirect_to @serie, notice: 'Serie review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serie_review
      @serie_review = SerieReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serie_review_params
      params.require(:serie_review).permit(:content, :series_id)
    end
end
