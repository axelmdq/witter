# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :text

  validates_presence_of :text

  belongs_to :tweet
  belongs_to :user
end
