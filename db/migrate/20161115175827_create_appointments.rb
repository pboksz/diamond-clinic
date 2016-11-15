class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor
      t.belongs_to :clinical_trial
      t.string :name
      t.string :email
      t.string :phone_number
      t.date :date
      t.string :time
      t.text :message

      t.timestamps null: false
    end
  end
end
