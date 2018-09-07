class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def destroy
    @schedule.destroy
  end
  
  private
  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :end_time)
  end
end