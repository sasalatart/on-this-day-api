# == Schema Information
#
# Table name: keywords
#
#  id         :integer          not null, primary key
#  episode_id :integer
#  title      :string
#  href       :string
#

class Keyword < ActiveRecord::Base
  belongs_to :episode

  validates_presence_of :title, :href
end
