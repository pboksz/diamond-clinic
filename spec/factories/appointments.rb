# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    doctor
    clinical_trial
    name 'First Last'
    email 'email@email.com'
    phone_number '555555555'
    date Date.today
    time '12:00'
    message 'This is a message.'
  end
end
