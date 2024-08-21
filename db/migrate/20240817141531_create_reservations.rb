class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :check_in_date
      t.string :check_out_date
      t.string :datetime
      t.integer :days
      t.integer :number_of_guests
      t.string :total_price
      t.integer :decimal

      t.timestamps
    end
  end
end
