class FavoriteChaptersController < ApplicationController
  before_action :set_favorite_chapter, only: [:show, :edit, :update, :destroy]

  # GET /favorite_chapters
  # GET /favorite_chapters.json
  def index
    @favorite_chapters = FavoriteChapter.all
  end

  # GET /favorite_chapters/1
  # GET /favorite_chapters/1.json
  def show
  end

  # GET /favorite_chapters/new
  def new
    @favorite_chapter = FavoriteChapter.new
    @favorite_chapter.user = current_user
    @favorite_chapter.chapter = Chapter.find(params[:chapter_id])
    respond_to do |format|
      if @favorite_chapter.save
        format.html { redirect_to @favorite_chapter.chapter, notice: 'Chapter was succesfully marked as favorite.' }
        format.json { render :show, status: :created, location: @favorite_chapter }
      else
        format.html { render :new }
        format.json { render json: @favorite_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /favorite_chapters/1/edit
  def edit
  end

  # POST /favorite_chapters
  # POST /favorite_chapters.json
  def create
    @favorite_chapter = FavoriteChapter.new(favorite_chapter_params)

    respond_to do |format|
      if @favorite_chapter.save
        format.html { redirect_to @favorite_chapter, notice: 'Favorite chapter was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_chapter }
      else
        format.html { render :new }
        format.json { render json: @favorite_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_chapters/1
  # PATCH/PUT /favorite_chapters/1.json
  def update
    respond_to do |format|
      if @favorite_chapter.update(favorite_chapter_params)
        format.html { redirect_to @favorite_chapter, notice: 'Favorite chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_chapter }
      else
        format.html { render :edit }
        format.json { render json: @favorite_chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_chapters/1
  # DELETE /favorite_chapters/1.json
  def destroy
    @favorite_chapter.destroy
    respond_to do |format|
      format.html { redirect_to @favorite_chapter.chapter, notice: 'Chapter was succesfully unmarked as favorite.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_chapter
      @favorite_chapter = FavoriteChapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_chapter_params
      params.fetch(:favorite_chapter, {})
    end
end
