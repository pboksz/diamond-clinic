class AppointmentMailer < ActionMailer::Base
  default :template_path => 'mailers'

  def appointment_email(appointment)
    @appointment = appointment

    mail :from => @appointment.email,
         :to => A9n.email_from,
         :cc => @appointment.email,
         :subject => "Appointment request from #{@appointment.name} for #{appointment.when}"
  end
end
