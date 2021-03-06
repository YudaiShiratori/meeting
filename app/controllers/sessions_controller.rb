class SessionsController < ApplicationController
  before_action :login, only: [:destroy]
  before_action :logout, only: [:new]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウト完了"
    redirect_to new_session_path
  end
  
  private
  def login
    if not logged_in?
      redirect_to new_session_path
      flash[:danger] = 'ログインしてください'
    end
  end
  def logout
    if logged_in?
      session.delete(:user_id)
      flash[:danger] = 'ログアウトしました'
    end
  end
  
end
