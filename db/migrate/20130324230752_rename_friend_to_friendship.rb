class RenameFriendToFriendship < ActiveRecord::Migration
  def up
    rename_table :friends, :friendships
  end

  def down
    rename_table :friendships, :friends
  end
end
