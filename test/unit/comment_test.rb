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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
