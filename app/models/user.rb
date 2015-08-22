class User < ActiveRecord::Base
  include ActiveModel::SecurePassword

  has_secure_password

  has_many :reservations
  has_many :devices

  validates_presence_of :email

  def data_attributes(device)
    {
      user: {
        name: "#{fname} #{lname}",
        username: username,
        email: email,
        api_key: device.api_key,
        auth_token: device.auth_token
      }
    }
  end

end
