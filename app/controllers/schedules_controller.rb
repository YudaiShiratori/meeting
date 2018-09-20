class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :login, only: [:new, :edit, :show, :destroy, :update]
  before_action :authenticate_schedule, only: [:edit, :destroy, :update]

  def index
    @schedules = Schedule.all
  end
  
  def show
    # @favorite = current_user.favorites.find_by(schedule_id: @schedule.id)
    
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
    @schedule.user_id = current_user.id

    respond_to do |format|
      if @schedule.save
        ScheduleMailer.schedule_mail(@schedule).deliver
        format.html { redirect_to @schedule, notice: '写真を投稿しました.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
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
      params.require(:schedule).permit(:start, :end, :user_id, :message)
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