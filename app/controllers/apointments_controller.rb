class ApointmentsController < ApplicationController
  def create
    apointment = current_user.apointment.create(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{apointment.schedule.user.name}との面接練習を予約しました"
  end
  
  def destroy
    apointment = current_user.apointment.find_by(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{apointment.schedule.user.name}との面接練習をキャンセルしました"
  end
end
