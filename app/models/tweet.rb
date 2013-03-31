# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  attr_accessible :text

  validates_presence_of :text

  belongs_to :user
  has_many :comments, :include => :user
end
