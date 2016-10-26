class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :insurance_co
      t.string :gender
      t.boolean :new_patient

      t.timestamps
    end
  end
end
