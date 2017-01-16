# == Schema Information
#
# Table name: day_months
#
#  id          :integer          not null, primary key
#  day         :integer
#  month       :integer
#  description :text
#

class DayMonth < ActiveRecord::Base
  MAX_DAYS_PER_MONTH = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze

  has_many :episodes

  validates_presence_of :day, :month

  validates :day, uniqueness: { scope: :month }

  validate :day_month_coherence

  def self.valid_date?(day, month)
    return false unless (1..31).cover?(day)
    return false unless (1..12).cover?(month)
    day <= MAX_DAYS_PER_MONTH[month - 1]
  end

  def to_json_with(episode_type)
    { id: id, day: day, month: month, description: description,
      :"#{episode_type}" => episodes.where(episode_type: episode_type.singularize) }
  end

  private

  def day_month_coherence
    return if DayMonth.valid_date?(day, month)
    errors.add(:base, 'Day exceeds largest for this month.')
  end
end
