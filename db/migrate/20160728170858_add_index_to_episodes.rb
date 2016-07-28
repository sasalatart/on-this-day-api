class AddIndexToEpisodes < ActiveRecord::Migration
  def change
    add_index :episodes, [:day, :month]
  end
end
