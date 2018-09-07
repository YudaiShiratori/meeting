class UsersController < ApplicationController
  
  def index
    @interviewers = User.where(admin: true)
    @interviewees = User.where(admin: false)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path,
      notice: 'ユーザー作成しました。次にログインしてください'
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
  
end