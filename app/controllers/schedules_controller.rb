class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update]
  before_action :login, only: [:new, :edit, :update]
  # before_action :authenticate_schedule, only: [:edit, :update]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save(validate: false)
      start_getu = params["getu_start"].to_i
      end_getu = params["getu_end"].to_i
      fin_getu = end_getu - 1
      [start_getu..fin_getu].each do |time|
        start = time
        fin = time + 1
        @eachschedule = Eachschedule.create(start: start, fin: fin, schedule_id: params[:schedule][:id], user_id: params[:schedule][:user_id] )
      end
      redirect_to mypage_user_path(current_user.id)
      flash[:notice] = '日程を登録しました'
    else
      render 'new', flash[:notice] = 'エラー'
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to user_path(current_user.id)
      flash[:notice] = '日程を編集しました'
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
  #   if current_user.id != @schedule.user_id
  #     redirect_to user_path(current_user.id)
  #     flash[:danger] = 'エラーがありました'
  #   end
  # end
end