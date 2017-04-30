class StoriesController < ApplicationController
  before_action :check_admin, only: [:new, :edit, :create, :destroy, :update]
	def index
		@stories = Story.all
	end
	def new
		@story = Story.new
	end

	def show
		@story = Story.find(params[:id])
	end

	def edit
		@story = Story.find(params[:id])
	end

	def create 
  		@story = Story.new(story_params) 
  		if @story.save 
    		redirect_to stories_path
  		else 
    		flash[:errors] = @story.errors 
  		end 
  	end

  	def destroy
  		@story = Story.find(params[:id])
  		@story.destroy
  		redirect_to stories_path
	end

	def update 
  		@story = Story.find(params[:id]) 
  		if @story.update_attributes(story_params) 
        redirect_to story_path(@story)
  		else 
    		flash[:errors] = @story.errors
		end 
	end

	private 
	  	def story_params 
	    	params.require(:story).permit(:title, :content, :date) 
      end

    def check_admin
      unless current_user.is_admin?
        redirect_to stories_path
      end
    end
end
