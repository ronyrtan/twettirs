# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  username        :text
#  name            :text
#  password_digest :string
#  profile_pic     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_many :whistles, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :star_whistles, dependent: :destroy
  has_many :stars, through: :star_whistles, source: :whistle

  def self.search(search)
    where("name ILIKE ? OR username ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
