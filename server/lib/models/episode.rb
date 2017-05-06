# == Schema Information
#
# Table name: episodes
#
#  id           :integer          not null, primary key
#  year         :integer
#  bce          :boolean          default(FALSE)
#  episode_type :string
#  text         :text
#  day_month_id :integer
#

class Episode < ActiveRecord::Base
  belongs_to :day_month
  has_many :keywords

  validates_presence_of :day_month_id, :year, :episode_type, :text

  validates :episode_type, inclusion: { in: %w(event birth death) }
end
