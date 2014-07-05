# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment_request do
    first_name 'First'
    last_name 'Last'
    phone_number '555555555'
  end
end
