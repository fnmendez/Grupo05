class StoriesController < ApplicationController
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
    		redirect_to '/stories' 
  		else 
    		flash[:errors] = @story.errors 
  		end 
	end
	def update 
  		@story = Story.find(params[:id]) 
  		if @story.update_attributes(story_params) 
    		redirect_to(:action => 'show', :id => @story.id) 
  		else 
    		flash[:errors] = @story.errors
		end 
	end

	private 
	  	def story_params 
	    	params.require(:story).permit(:title, :content, :date) 
	  	end
end
