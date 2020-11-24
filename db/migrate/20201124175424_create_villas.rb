class CreateVillas < ActiveRecord::Migration[6.0]
  def change
    create_table :villas do |t|
      t.string :title
      t.text :description
      t.string :location
      t.text :services
      t.integer :price_per_night
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_beds

      t.timestamps
    end
  end
end
