class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :villa, null: false, foreign_key: true
      t.date :date
      t.integer :number_of_nights
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
