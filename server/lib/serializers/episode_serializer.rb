class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :year, :bce, :episode_type, :text, :day_month_id

  has_many :keywords
end
