class AddDayMonthToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :episodes, :day_month, index: true
  end
end
