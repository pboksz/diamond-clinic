class AppointmentMailer < ActionMailer::Base
  default :template_path => 'mailers'

  def appointment_email(appointment)
    @appointment = appointment

    mail :from => @appointment.email,
         :to => A9n.email_from,
         :cc => @appointment.email,
         :subject => t('mailers.subject', :name => @appointment.name, :when => @appointment.when)
  end
end
