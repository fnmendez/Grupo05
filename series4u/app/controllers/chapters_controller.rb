class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])
    @favorite_chapter = FavoriteChapter.where(chapter: @chapter, user: current_user)
    @view = View.where(user: current_user, chapter: @chapter)
    @views = View.where(chapter: @chapter)
    @chapter_rating = ChapterRating.where(view: @view)
    @chapter_ratings = ChapterRating.where(view: @views)
    @chapter_reviews = ChapterReview.where(view: @views)
  end

  # GET /chapters/new
  def new
    @season = Season.find(params[:season_id])
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find(params[:id])
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.user = current_user
    @chapter.season = Season.find(params[:season_id])

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    @season = @chapter.season
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @season = @chapter.season
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to @season, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def share
    @chapter = Chapter.find(params[:id])
    ChapterMailer.share_chapter_mail(@chapter, current_user, params[:share][:email]).deliver_later
    redirect_to @chapter
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:title, :summary, :user_id, :season_id)
    end
end
