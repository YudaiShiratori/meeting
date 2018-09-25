class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :login, only: [:new, :edit, :show, :destroy, :update]
  # before_action :authenticate_schedule, only: [:new, :edit, :destroy, :update]

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
      a = params["getu_start"].to_i
      b = params["getu_end"].to_i
      # c = b.slice!(-1)
      [a..b].each do |time|
        start = time
        fin = time + 1
        @eachschedule = Eachschedule.create(start: start, fin: fin, schedule_id: params[:schedule][:id] )
      end
      redirect_to user_path(current_user.id)
    else
      render 'new', notice: "エラー"
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to user_path(current_user.id)
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
    :doyou_start, :doyou_end, :niti_start, :niti_end,
    eachschedule_items_attributes: [:start, :fin, :schedule_id, :user_id]
    )
  end
  
  def login
    if not logged_in? 
      redirect_to new_session_path
    end
  end
    
    # def authenticate_schedule
    #   if current_user.id != @schedule.user.id
    #     redirect_to schedules_path
    #   end
    # end
end