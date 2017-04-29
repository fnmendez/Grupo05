class KidsController < ApplicationController

  def show
  end

  def index
    @kids = current_user.kiddies
  end

  def new
    @kid = User.new
  end

  def create
    @kid = User.new(kid_params)
    if @kid.save
      kiddie = current_user.kids.build(kiddy_id: @kid.id)
      unless kiddie.save
        flash[:errors] = kiddie.errors
      end
    else
      flash[:errors] = @kid.errors
    end
    redirect_to kids_path
  end

end

private

def kid_params
  params.require(:user).permit(:full_name, :username, :password, :password_confirmation).merge({email: current_user.email, role: 2})
end