class TopsController < ApplicationController
  def index
    if logged_in?
      session.delete(:user_id)
      flash[:danger] = 'ログアウトしました'
    end
  end
end
