class DayMonthSerializer < ActiveModel::Serializer
  attributes :id, :day, :month, :description

  has_many :episodes

  def episodes
    Episode.send(scope[:episode_type].to_sym).where(day_month_id: id)
  end
end
