class RenameColumnsInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :check_in_date, :check_in
    rename_column :reservations, :check_out_date, :check_out
  end
end
