# == Schema Information
#
# Table name: friends
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  best_friend :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Friendship < ActiveRecord::Base
  attr_accessible :best_friend, :user_id

  belongs_to :user
  belongs_to :friend, :class_name => "User"

end
