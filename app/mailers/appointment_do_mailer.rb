class AppointmentDoMailer < ApplicationMailer
  def appointment_do_mail(interviewee)
    @interviewee = interviewee
    
    mail to: @interviewee.email, subject: "面談予約完了メール"
  end
end
