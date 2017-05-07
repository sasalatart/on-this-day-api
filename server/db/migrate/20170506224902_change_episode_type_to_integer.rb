class ChangeEpisodeTypeToInteger < ActiveRecord::Migration[5.0]
  def up
    change_column :episodes, :episode_type, "integer USING (CASE episode_type WHEN 'event' THEN '0'::integer WHEN 'birth' THEN '1'::integer ELSE '2'::integer END)", null: false, default: 0
  end

  def down
    change_column :episodes, :episode_type, "varchar USING (CASE episode_type WHEN '0' THEN 'event'::varchar WHEN '1' THEN 'birth'::varchar ELSE 'death'::varchar END)", null: false, default: 'event'
  end
end
