# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor do
    first_name 'First'
    last_name 'Last'
    specialty 'Specialty'
    biography_en 'Doctor biography in English...'
    biography_pl 'Doctor biography in Polish...'
  end
end
