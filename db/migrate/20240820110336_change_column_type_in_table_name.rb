class ChangeColumnTypeInTableName < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :check_out, :datetime
    change_column :reservations, :total_price, :integer
  end
end

