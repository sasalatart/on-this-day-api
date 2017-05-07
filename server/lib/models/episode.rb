# == Schema Information
#
# Table name: episodes
#
#  id           :integer          not null, primary key
#  year         :integer
#  bce          :boolean          default(FALSE)
#  episode_type :integer          default("event"), not null
#  text         :text
#  day_month_id :integer
#

class Episode < ActiveRecord::Base
  enum episode_type: { event: 0, birth: 1, death: 2 }

  belongs_to :day_month
  has_many :keywords

  validates_presence_of :day_month_id, :year, :episode_type, :text
end
