class ChapterDirectedController < ApplicationController
  before_action :set_chapter_directed, only: [:show, :edit, :update, :destroy]

  # GET /chapter_directed
  # GET /chapter_directed.json
  def index
    @chapter_directed = ChapterDirected.all
  end

  # GET /chapter_directed/1
  # GET /chapter_directed/1.json
  def show
  end

  # GET /chapter_directed/new
  def new
    @chapter_directed = ChapterDirected.new
  end

  # GET /chapter_directed/1/edit
  def edit
  end

  # POST /chapter_directed
  # POST /chapter_directed.json
  def create
    @chapter_directed = ChapterDirected.new(chapter_directed_params)

    respond_to do |format|
      if @chapter_directed.save
        format.html { redirect_to @chapter_directed, notice: 'ChapterDirected was successfully created.' }
        format.json { render :show, status: :created, location: @chapter_directed }
      else
        format.html { render :new }
        format.json { render json: @chapter_directed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapter_directed/1
  # PATCH/PUT /chapter_directed/1.json
  def update
    respond_to do |format|
      if @chapter_directed.update(chapter_directed_params)
        format.html { redirect_to @chapter_directed, notice: 'ChapterDirected was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter_directed }
      else
        format.html { render :edit }
        format.json { render json: @chapter_directed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapter_directed/1
  # DELETE /chapter_directed/1.json
  def destroy
    @chapter_directed.destroy
    respond_to do |format|
      format.html { redirect_to Chapter.find(@chapter_directed.chapter_id), notice: 'The Director presence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter_directed
      @chapter_directed = ChapterDirected.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_directed_params
      params.fetch(:chapter_directed, {})
    end
end
