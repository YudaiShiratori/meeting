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

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save(validate: false)
      if (@schedule.getu_start) && (@schedule.getu_end)
        @schedule.getu_start.upto(@schedule.getu_end) do |time|
          each_schedule =
            Eachschedule.create(start: time, fin: time + 1,
              weekday: 'monday',
              schedule_id: @schedule.id,
              user_id: @schedule.user_id)
        end
      end
      if (@schedule.ka_start.present?) && (@schedule.ka_end.present?)
        @schedule.ka_start.upto(@schedule.ka_end) do |time|
          each_schedule = Eachschedule.create(start: time, fin: time + 1, weekday: 'tuesday', schedule_id: @schedule.id, user_id: @schedule.user_id)
        end
      end
      if (@schedule.sui_start.present?) && (@schedule.sui_end.present?)
        @schedule.sui_start.upto(@schedule.sui_end) do |time|
          each_schedule = Eachschedule.create(start: time, fin: time + 1, weekday: 'wednesday', schedule_id: @schedule.id, user_id: @schedule.user_id)
        end
      end
      if (@schedule.moku_start.present?) && (@schedule.moku_end.present?)
        @schedule.moku_start.upto(@schedule.moku_end) do |time|
          each_schedule = Eachschedule.create(start: time, fin: time + 1, weekday: 'thursday', schedule_id: @schedule.id, user_id: @schedule.user_id)
        end
      end
      if (@schedule.kin_start.present?) && (@schedule.kin_end.present?)
        @schedule.kin_start.upto(@schedule.kin_end) do |time|
          each_schedule = Eachschedule.create(start: time, fin: time + 1, weekday: 'friday', schedule_id: @schedule.id, user_id: @schedule.user_id)
        end
      end
      if (@schedule.doyou_start.present?) && (@schedule.doyou_end.present?)
        @schedule.doyou_start.upto(@schedule.doyou_end) do |time|
          each_schedule = Eachschedule.create(start: time, fin: time + 1, weekday: 'saturday', schedule_id: @schedule.id, user_id: @schedule.user_id)
        end
      end
      if (@schedule.niti_start.present?) && (@schedule.niti_end.present?)
        @schedule.niti_start.upto(@schedule.niti_end) do |time|
          each_schedule = Eachschedule.create(start: time, fin: time + 1, weekday: 'sunday', schedule_id: @schedule.id, user_id: @schedule.user_id)
        end
      end
      redirect_to mypage_user_path(current_user.id)
      flash[:notice] = '日程を登録しました'
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @schedule.update(schedule_params)
      if (@schedule.getu_start) && (@schedule.getu_end)
        @schedule.getu_start.upto(@schedule.getu_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'monday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'monday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      
      if (@schedule.ka_start) && (@schedule.ka_end)
        @schedule.ka_start.upto(@schedule.ka_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'tuesday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'tuesday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      
      if (@schedule.sui_start) && (@schedule.sui_end)
        @schedule.sui_start.upto(@schedule.sui_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'wednesday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'wednesday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      
      if (@schedule.moku_start) && (@schedule.moku_end)
        @schedule.moku_start.upto(@schedule.moku_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'monday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'thursday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      
      if (@schedule.kin_start) && (@schedule.kin_end)
        @schedule.kin_start.upto(@schedule.kin_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'friday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'friday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      
      if (@schedule.doyou_start) && (@schedule.doyou_end)
        @schedule.doyou_start.upto(@schedule.doyou_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'saturday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'saturday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      
      if (@schedule.niti_start) && (@schedule.niti_end)  
        @schedule.niti_start.upto(@schedule.niti_end) do |time|
          exist_ids = []
          each_schedule = @schedule.eachschedules.find_by(start: time, fin: time + 1, weekday: 'sunday')
          if each_schedule
            exist_ids << each_schedule.id
          else
            exist_ids << 
            Eachschedule.create(
              start: time, fin: time + 1, weekday: 'sunday', schedule_id: @schedule.id, user_id: @schedule.user_id
              ).id
          end
          delete_each_schedule = @schedule.eachschedules.where.not(id: exist_ids)
          delete_each_schedule.delete_all
        end
      end
      redirect_to mypage_user_path(current_user.id)
      flash[:notice] = '日程を更新しました'
    else
      render 'new'
      # , flash[:notice] = 'エラー'
    end
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :user_id, 
      :schedule_id,
      :getu_start, :getu_end, 
      :ka_start, :ka_end,
      :sui_start, :sui_end,
      :moku_start, :moku_end,
      :kin_start, :kin_end, 
      :doyou_start, :doyou_end,
      :niti_start, :niti_end,
    # eachschedule_items_attributes: [:start, :fin, :weekday, :schedule_id, :user_id]
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