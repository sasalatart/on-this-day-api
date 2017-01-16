class RemoveDayAndMonthFromEpisodes < ActiveRecord::Migration[5.0]
  def change
    remove_column :episodes, :day
    remove_column :episodes, :month
  end
end
