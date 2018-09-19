class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy] 

  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @schedules }
      format.json { render :json => @schedules }
    end
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end
  
    def show
    @schedule = schedule.all
    # render :json => @schedule
    respond_to do |format|
      format.json {
        render json:
        @schedule.to_json(
          only: [:title, :start, :end]
        )
      }
    end
  end

  def create
    schedule = Schedule.new
    schedule.attributes = {
      title: params[:title],
      start: params[:start],
      end: params[:end],
    }
    Schedule.save
    respond_to do |format|
      format.json {
        render json:
        @schedulr.to_json(
          only: [:title, :start, :end]
        )
      }
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
      @schedule = schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(
        :title,
        :start,
        :end
      )
    end
end