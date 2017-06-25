class SchedulesController < ApplicationController
	def show
		@to_sees = ToSee.where(user: current_user)
	end
end
