class UsersController < ApplicationController

  def show
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def destroy_kid
    @kid = User.find(params[:kid])
    @kid.destroy
    redirect_back(fallback_location: root_path)
  end
end
