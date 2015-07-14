class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reservations, dependent: :destroy
  validates_inclusion_of :gender, in: %w(male female other)
  validates_inclusion_of :age, in: 15..60   # Life is unfair
end
