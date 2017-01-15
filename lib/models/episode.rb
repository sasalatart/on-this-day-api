# == Schema Information
#
# Table name: episodes
#
#  id           :integer          not null, primary key
#  day          :integer
#  month        :integer
#  year         :integer
#  bce          :boolean          default(FALSE)
#  episode_type :string
#  text         :text
#

class Episode < ActiveRecord::Base
  validates :day, presence: true,
                  inclusion: 1..31

  validates :month, presence: true,
                    inclusion: 1..12

  validates :year, presence: true

  validates :episode_type, presence: true,
                           inclusion: { in: %w(event birth death) }

  validates :text, presence: true
end
