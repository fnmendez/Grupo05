class UsersController < ApplicationController

  def show
    unless user_signed_in?
      redirect_to root_path
    end
    if current_user.role == 2
      @parent = 123
    end
  end

end
