# == Schema Information
#
# Table name: star_whistles
#
#  id         :integer          not null, primary key
#  whistle_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StarWhistle < ActiveRecord::Base
  belongs_to :whistle
  belongs_to :user
end
