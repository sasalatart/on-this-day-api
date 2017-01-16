class CreateDayMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :day_months do |t|
      t.integer :day
      t.integer :month
      t.text :description
    end
  end
end
