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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy

  validates_inclusion_of :gender, in: %w(male female other)
  validates_inclusion_of :age, in: 18..99
end
