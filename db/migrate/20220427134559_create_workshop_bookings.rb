class CreateWorkshopBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :workshop_bookings do |t|
      t.string :stripe_customer_id
      t.string :stripe_charge_id
      t.integer :amount_paid
      t.integer :tickets_booked
      t.references :workshop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
