class AppointmentMailer < ApplicationMailer
  def do_appointment_mail(interviewee)
    @interviewee = interviewee
    
    mail to: @interviewee.email, subject: "面談予約完了メール"
  end
  
  def done_appointment_mail(appointment)
    @appointment = appointment
    
    mail to: @appointment.eachschedule.user, subject: "[要確認]面談の予約が入りました"
end