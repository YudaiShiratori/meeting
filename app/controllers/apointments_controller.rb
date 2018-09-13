class ApointmentsController < ApplicationController
  def create
    apointment = current_user.apointment.create(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{apointment.schedule.user.name}との面接練習を予約しましたを"
  end
end
