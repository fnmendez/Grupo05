class ChapterReviewsController < ApplicationController
  before_action :set_chapter_review, only: [:show, :edit, :update, :destroy]

  # GET /chapter_reviews
  # GET /chapter_reviews.json
  def index
    @chapter_reviews = ChapterReview.all
  end

  # GET /chapter_reviews/1
  # GET /chapter_reviews/1.json
  def show
  end

  # GET /chapter_reviews/new
  def new
    @chapter = Chapter.find(params[:chapter_id])
    @chapter_review = ChapterReview.new
  end

  # GET /chapter_reviews/1/edit
  def edit
    @chapter_review = ChapterReview.find(params[:id])
    @chapter = View.find(@chapter_review.view_id).chapter
  end

  # POST /chapter_reviews
  # POST /chapter_reviews.json
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @chapter_review = ChapterReview.new(chapter_review_params)
    @chapter_review.view = View.where(user: current_user, chapter: @chapter).first

    respond_to do |format|
      if @chapter_review.save
        format.html { redirect_to @chapter, notice: 'Chapter review was successfully created.' }
        format.json { render :show, status: :created, location: @chapter_review }
      else
        format.html { render :new }
        format.json { render json: @chapter_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapter_reviews/1
  # PATCH/PUT /chapter_reviews/1.json
  def update
    @chapter = View.find(@chapter_review.view_id).chapter
    respond_to do |format|
      if @chapter_review.update(chapter_review_params)
        format.html { redirect_to @chapter, notice: 'Chapter review was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter_review }
      else
        format.html { render :edit }
        format.json { render json: @chapter_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapter_reviews/1
  # DELETE /chapter_reviews/1.json
  def destroy
    @chapter = View.find(@chapter_review.view_id).chapter
    @chapter_review.destroy
    respond_to do |format|
      format.html { redirect_to @chapter, notice: 'Chapter review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter_review
      @chapter_review = ChapterReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_review_params
      params.require(:chapter_review).permit(:content, :view_id)
    end
end
