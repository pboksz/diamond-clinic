# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    doctor_id { create(:doctor).id }
    first_name 'First'
    last_name 'Last'
    email 'email@email.com'
    phone_number '555555555'
    message 'This is a message.'
  end
end
