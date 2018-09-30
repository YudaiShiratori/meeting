class AppointmentDoneMailer < ApplicationMailer
  def appointment_done_mail(appointment)
    @appointment = appointment
    @interviewer = User.find_by(@appintment.user_id)
    mail to: @interviewer.email, subject: "[要確認]面談の予約が入りました"
  end
end