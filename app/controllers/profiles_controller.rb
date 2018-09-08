class ProfilesController < ApplicationController
  
  def new
    @profile = Profile.new
  end
  
  def create
     @profile = profile.new(profile_params)
    if @profile.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def show
  end
  
  private
  def profile_params
    params.require(:profile).permit(:title, :content)
  end
end
