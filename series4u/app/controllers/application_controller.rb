class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :last_chapter

  def last_chapter
    unless user_signed_in?
      return root_path
    end
    last_view = View.where(user:current_user).last
    @chapter = last_view.nil?? root_path : last_view.chapter
  end
end
