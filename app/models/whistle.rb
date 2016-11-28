# == Schema Information
#
# Table name: whistles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post       :text
#  star       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Whistle < ActiveRecord::Base

  belongs_to :user

  acts_as_taggable_on :tags

  has_many :star_whistles, dependent: :destroy
  has_many :stared_by, through: :star_whistles, source: :user

end
