class CreateWorkshops < ActiveRecord::Migration[7.0]
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :start_time
      t.string :end_time
      t.integer :total_sits
      t.integer :remaining_sits
      t.integer :registration_fee

      t.timestamps
    end
  end
end
