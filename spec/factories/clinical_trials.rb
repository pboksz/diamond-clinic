# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clinical_trial do
    order 1
    condition_pl 'Condition'
    condition_en 'Choroba'
    description_pl 'Description in Polish'
    description_en 'Description in English'
  end
end
