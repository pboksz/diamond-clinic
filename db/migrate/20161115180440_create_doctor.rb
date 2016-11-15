class CreateDoctor < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.integer :order
      t.string :name_pl
      t.string :name_en
      t.string :specialty_pl
      t.string :specialty_en
      t.text :biography_pl
      t.text :biography_en

      t.timestamps null: false
    end
  end
end
