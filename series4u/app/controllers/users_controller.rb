class UsersController < ApplicationController

  def show
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def index
    unless user_signed_in? && current_user.is_admin?
      redirect_to root_path
    end
    @users = User.all
  end

  def admin_show
    unless user_signed_in?
      redirect_to root_path
    end
    @user = User.find(params[:id])
  end

  def destroy_kid
    @kid = User.find(params[:kid])
    @kid.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if user_signed_in? && current_user.is_admin?
      @user = User.find(params[:user_id])
      unless @user.is_admin?
        @user.destroy
      end
      redirect_back(fallback_location: users_path)
    end
  end

  def promote
    if current_user.is_admin?
      @user = User.find(params[:id])
      if !@user.is_admin? && !@user.is_kid?
        @user.role = 0
        @user.save
      end
    end
    redirect_back(fallback_location: users_path)
  end

end
