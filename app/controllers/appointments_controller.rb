class AppointmentsController < ApplicationController
  
  def create
    appointment = current_user.appointments.create(
      eachschedule_id: params[:eachschedule_id],
      interviewee_id: params[:interviewee_id],
      user_id: params[:user_id]
      )
    redirect_to mypage_user_path(appointment.user_id), notice: "#{appointment.eachschedule.schedule.user}との面接練習を予約しました"
  end
  
  # def create
  #   favorite = current_user.favorites.create(blog_id: params[:blog_id])
  #   redirect_to blogs_url, notice: "#{favorite.blog.user.name}のブログをお気に入りしました"
  # end
  
  def destroy
    appointment = current_user.appointment.find_by(schedule_id: params[:schedule_id])
    redirect_to schedules_url, notice: "#{appointment.eachschedule.scheduled_user}との面接練習をキャンセルしました"
  end
end
