class AppointmentDoneMailer < ApplicationMailer
  def done_appointment_mail(appointment)
    @appointment = appointment
    
    mail to: @appointment.eachschedule.user, subject: "[要確認]面談の予約が入りました"
  end
end
