class AppointmentsController < ApplicationController
  
  def create
    appointment = current_user.appointment.create(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{appointment.eachschedule.scheduled_user}との面接練習を予約しました"
  end
  
  def destroy
    appointment = current_user.appointment.find_by(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{appointment.eachschedule.scheduled_user}との面接練習をキャンセルしました"
  end
end
