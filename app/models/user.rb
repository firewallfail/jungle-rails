class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    pp user.inspect
    if user && user.authenticate(password)
      return user
    end
    return nil
  end

end
