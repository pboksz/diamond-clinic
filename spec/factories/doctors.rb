# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor do
    name 'Dr. First Last'
    specialty_pl 'Kardiolog'
    specialty_en 'Cardiologist'
    biography_pl 'Biography in Polish...'
    biography_en 'Biography in English...'
  end
end
