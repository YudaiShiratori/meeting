class AppointmentDoMailer < ApplicationMailer
  def do_appointment_mail(interviewee)
    @interviewee = interviewee
    
    mail to: @interviewee.email, subject: "面談予約完了メール"
  end
end
