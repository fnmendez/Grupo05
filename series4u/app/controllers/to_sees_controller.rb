class ToSeesController < ApplicationController
  before_action :set_to_see, only: [:show, :edit, :update, :destroy]

  # GET /to_sees
  # GET /to_sees.json
  def index
    @to_sees = ToSee.all
  end

  # GET /to_sees/1
  # GET /to_sees/1.json
  def show
  end

  # GET /to_sees/new
  def new
    @to_see = ToSee.new
  end

  # GET /to_sees/1/edit
  def edit
  end

  # POST /to_sees
  # POST /to_sees.json
  def create
    @to_see = ToSee.new(to_see_params)
    @to_see.user = current_user
    @to_see.chapter = Chapter.find(params[:chapter_id])

    respond_to do |format|
      if @to_see.save
        format.html { redirect_to @to_see.chapter, notice: 'Chapter scheduled succesfully.' }
        format.json { render :show, status: :created, location: @to_see }
      else
        format.html { render :new }
        format.json { render json: @to_see.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_sees/1
  # PATCH/PUT /to_sees/1.json
  def update
    respond_to do |format|
      if @to_see.update(to_see_params)
        format.html { redirect_to @to_see, notice: 'To see was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_see }
      else
        format.html { render :edit }
        format.json { render json: @to_see.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_sees/1
  # DELETE /to_sees/1.json
  def destroy
    @to_see.destroy
    respond_to do |format|
      format.html { redirect_to @to_see.chapter, notice: 'Chapter was successfully unscheduled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_see
      @to_see = ToSee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_see_params
      params.require(:to_see).permit(:start_time)
    end
end
