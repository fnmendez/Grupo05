class ChapterActsController < ApplicationController
  before_action :set_chapter_act, only: [:show, :edit, :update, :destroy]

  # GET /chapter_act
  # GET /chapter_act.json
  def index
    @chapter_act = ChapterAct.all
  end

  # GET /chapter_act/1
  # GET /chapter_act/1.json
  def show
  end

  # GET /chapter_act/new
  def new
    @chapter_act = ChapterAct.new
  end

  # GET /chapter_act/1/edit
  def edit
  end

  # POST /chapter_act
  # POST /chapter_act.json
  def create
    @chapter_act = ChapterAct.new(chapter_act_params)
    @chapter = Chapter.find(params[:chapter_id])
    @chapter_act.chapter = @chapter

    respond_to do |format|
      if @chapter_act.save
        format.html { redirect_to @chapter, notice: 'Actor was successfully added.' }
        format.json { render :show, status: :created, location: @chapter_act }
      else
        format.html { render :new }
        format.json { render json: chapter_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapter_act/1
  # PATCH/PUT /chapter_act/1.json
  def update
    respond_to do |format|
      if chapter_url.update(chapter_act_params)
        format.html { redirect_to chapter_url, notice: 'ChapterAct was successfully updated.' }
        format.json { render :show, status: :ok, location: chapter_url }
      else
        format.html { render :edit }
        format.json { render json: @chapter_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapter_act/1
  # DELETE /chapter_act/1.json
  def destroy
    @chapter_act.destroy
    respond_to do |format|
      format.html { redirect_to @chapter_act.chapter, notice: 'The Actor presence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter_act
      @chapter_act = ChapterAct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_act_params
      params.require(:chapter_act).permit(:actor_id)
    end
end
