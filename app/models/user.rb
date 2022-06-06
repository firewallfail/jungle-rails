class User < ApplicationRecord

  has_secure_password

  def authenticate_with_credentials
  end

end
