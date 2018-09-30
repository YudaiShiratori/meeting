class AppointmentsController < ApplicationController
  
  def create
    appointment = current_user.appointments.create(
      eachschedule_id: params[:eachschedule_id],
      interviewee_id: params[:interviewee_id],
      user_id: params[:user_id]
      )
    redirect_to mypage_user_path(appointment.user_id), notice: "#{appointment.eachschedule.schedule.user.name}との面接練習を予約しました"
  end
  
  def destroy
    appointment = current_user.appointment.find_by(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{appointment.eachschedule.scheduled_user}との面接練習をキャンセルしました"
  end
  
end