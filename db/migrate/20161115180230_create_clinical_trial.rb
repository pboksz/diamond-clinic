class CreateClinicalTrial < ActiveRecord::Migration
  def change
    create_table :clinical_trials do |t|
      t.integer :order
      t.string :condition_pl
      t.string :condition_en
      t.text :description_pl
      t.text :description_en

      t.timestamps null: false
    end
  end
end
