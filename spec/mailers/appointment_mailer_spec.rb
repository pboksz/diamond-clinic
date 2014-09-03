require 'rails_helper'

describe AppointmentMailer do
  describe '#appointment_email' do
    let(:appointment) { build(:appointment) }
    subject { AppointmentMailer.appointment_email(appointment) }

    it 'creates the email' do
      expect(subject.from).to include appointment.email
      expect(subject.to).to include A9n.email_from
      expect(subject.cc).to include appointment.email
      expect(subject.subject).to include appointment.name, appointment.date.to_s, appointment.time
    end
  end
end
