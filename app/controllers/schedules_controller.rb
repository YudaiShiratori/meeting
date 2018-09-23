class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :login, only: [:new, :edit, :show, :destroy, :update]
  before_action :authenticate_schedule, only: [:edit, :destroy, :update]

  def index
    @schedules = Schedule.all
  end
  
  def show
    @comment = @schedule.comments.build
    @comments = @schedule.comments
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save(validate: false)
      redirect_to user_path(current_user.id)
    else
      render 'new', notice: "エラー"
    end
  end

  def update
    if @schedule.update
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:start, :end, :user_id, :schedule_id,
      :getu_start, :getu_end, :ka_start, :ka_end, :sui_start, :sui_end,
      :moku_start, :moku_end, :kin_start, :kin_end, 
      :doyou_start, :doyou_end, :niti_start, :niti_end
      )
    end
    
    def login
      if not logged_in? 
        redirect_to new_session_path
      end
    end
    
    def authenticate_schedule
      if current_user.id != @schedule.user.id
         redirect_to schedules_path
      end
    end
end