class AddIndexToDayMonths < ActiveRecord::Migration[5.0]
  def change
    add_index :day_months, [:day, :month]
  end
end
