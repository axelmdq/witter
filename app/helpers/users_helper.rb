module UsersHelper
  def decode(password)
    User.decode(password)
  end
end
