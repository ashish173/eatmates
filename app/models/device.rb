class Device < ActiveRecord::Base
	include Tokenable

	belongs_to :user

	def jwt_payload
    { model: User.class.name, id: self.user.id.to_s, device_id: device_id}
  end
end
