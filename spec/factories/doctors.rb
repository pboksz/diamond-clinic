# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor do
    order 1
    name_pl 'Lek. First Last'
    name_en 'Dr. First Last'
    specialty_pl 'Kardiolog'
    specialty_en 'Cardiologist'
    biography_pl 'Biography in Polish...'
    biography_en 'Biography in English...'

    factory :doctor_with_photo do
      photo Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test.png", 'image/png')
    end
  end
end
