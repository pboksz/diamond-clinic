# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor do
    first_name 'First'
    last_name 'Last'
    biography 'Doctor biography...'
  end
end
