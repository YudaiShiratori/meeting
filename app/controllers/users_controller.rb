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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_user_path,
      notice: 'マイページを編集しました'
    else
      render 'edit', notice: 'a'
    end
  end
  
  def mypage
    @user = User.find(params[:id])
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :admin,
      :introduction, :image, :image_cache
    )
  end
  
end