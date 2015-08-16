class Reservation < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of  :restaurant_name, :place, :time_of_reservation
  validates_inclusion_of :gender_pref, in: %w(male female)

  def self.as_json(data)
    data.as_json(
       include: {
        user: { only: [:id, :name] },
        comments: {only: [:id, :message, :created_at]}
      }
    )
  end
end
