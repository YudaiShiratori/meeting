class AppointmentMailer < ApplicationMailer
  def appointment_mail(interviewee)
    @interviewee = interviewee
    
    mail to: @interviewee.email, subject: "面談予約完了メール"
    mail to: @interviewee.match_schedule.scheduled_user, subject: "[要確認]面談の予約が入りました"
  end
end
