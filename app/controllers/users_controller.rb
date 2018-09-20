class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :mypage, :mypage_edit] 
  before_action :login, only: [:edit, :show, :mypage, :mypage_edit]
  before_action :logout, only: [:new]
  
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
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to mypage_user_path,
      notice: 'マイページを編集しました'
    else
      render 'edit', notice: 'エラー'
    end
  end
  
  def mypage
  end
  
  def mypage_edit
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :admin,
      :introduction, :image, :image_cache
    )
  end
  
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