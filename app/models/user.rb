# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  name       :string(255)
#  surname    :string(255)
#  password   :string(255)
#  about_me   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :about_me, :name, :password, :surname, :username, :email, :picture


  has_attached_file :picture, :styles => {:thumb => "100x100#",
                                          :small  => "150x150>",
                                          :normal => "200x200#"},
                    :default_url => '/images/avatar_man_:style.jpg'
                    #:url  => "/assets/users/:id/:style/:basename.:extension",
                    #:path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 2.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

  validates_presence_of :username, :password, :email
  validates_uniqueness_of :email, :username

  before_save :encrypt_password

  has_many :tweets
  has_many :comments

  # Comienzo de cambios para agregar amigos.
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # fin de cambios para agregar amigos


  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == Digest::MD5.hexdigest(password)
      user
    else
      nil
    end
  end

  def self.search(name_filter)
    result = order('created_at DESC') # note: default is all, just sorted
    result = result.where('name LIKE ?', "%#{name_filter}%").order('created_at DESC') if name_filter.present?
    result
  end


  def self.friends(user_id)
    Friendship.where('user_id = ?', user_id)
  end

  private

  def encrypt_password
    self.password = encrypt(self.password)
  end

  def encrypt(string)
    Digest::MD5.hexdigest(string)
  end
end
