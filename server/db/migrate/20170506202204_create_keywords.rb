class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.integer :episode_id, index: true
      t.string  :title
      t.string  :href
    end
  end
end
