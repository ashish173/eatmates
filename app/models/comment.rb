class Comment < ActiveRecord::Base

  validates_presence_of :message, :user_id, :reservation_id

  belongs_to :user
  belongs_to :reservation
end
