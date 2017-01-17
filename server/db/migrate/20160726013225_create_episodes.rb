class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.boolean :bce, default: false
      t.string :episode_type
      t.text :text
    end
  end
end
