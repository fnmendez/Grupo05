class ChapterRatingsController < ApplicationController
  before_action :set_chapter_rating, only: [:show, :edit, :update, :destroy]

  # GET /chapter_ratings
  # GET /chapter_ratings.json
  def index
    @chapter_ratings = ChapterRating.all
  end

  # GET /chapter_ratings/1
  # GET /chapter_ratings/1.json
  def show
  end

  # GET /chapter_ratings/new
  def new
    @chapter = Chapter.find(params[:chapter_id])
    @chapter_rating = ChapterRating.new
  end

  # GET /chapter_ratings/1/edit
  def edit
    @chapter_rating = ChapterRating.find(params[:id])
    @chapter = View.find(@chapter_rating.view_id).chapter
  end

  # POST /chapter_ratings
  # POST /chapter_ratings.json
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @chapter_rating = ChapterRating.new(chapter_rating_params)
    @chapter_rating.view = View.where(user: current_user, chapter: @chapter).first

    respond_to do |format|
      if @chapter_rating.save
        format.html { redirect_to @chapter, notice: 'Chapter rating was successfully created.' }
        format.json { render :show, status: :created, location: @chapter_rating }
      else
        format.html { render :new }
        format.json { render json: @chapter_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapter_ratings/1
  # PATCH/PUT /chapter_ratings/1.json
  def update
    @chapter = View.find(@chapter_rating.view_id).chapter
    respond_to do |format|
      if @chapter_rating.update(chapter_rating_params)
        format.html { redirect_to @chapter, notice: 'Chapter rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter_rating }
      else
        format.html { render :edit }
        format.json { render json: @chapter_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapter_ratings/1
  # DELETE /chapter_ratings/1.json
  def destroy
    @chapter_rating.destroy
    respond_to do |format|
      format.html { redirect_to chapter_ratings_url, notice: 'Chapter rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter_rating
      @chapter_rating = ChapterRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_rating_params
      params.require(:chapter_rating).permit(:stars)
    end
end
