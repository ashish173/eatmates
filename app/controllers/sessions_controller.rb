class SessionsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:create]

	# Signin
	def create
		invalid_params and return unless params[:session].present?

		# Later change params[:session][:login] to a bool for
		# Identification for web and mobile user
		if params[:session][:login]
			render({message: 'device id not found'}, :unprocessable_entity) and return unless params[:session][:device_id].present?
			load_user
		else
			invalid_params
		end

		if @user && @user.authenticate(params[:session][:password])
      puts "User is authenticated"
      update_user_and_device_fields
      render json: {
              message: 'Successfully signed in',
              data: @user.data_attributes(@device)
            }, status: :ok
    else
      invalid_params
    end
	end

	# Signout
	def destroy
		# remove jwt token
	end


	private

	# Load the user
	def load_user
		# Later add support for username
		login = params[:session][:login]
    @user = User.where(email: login).first
	end

	def invalid_params
		render({message: "Invalid params"}, :unprocessable_entity)
	end

	def update_user_and_device_fields
    @device = if params[:session][:device_id].present?
                @user.devices.find_or_create_by(device_id: params[:session][:device_id])
              else
                @user.devices.create!
              end

    # @device.update_tracked_fields
    @device.generate_and_set_token
    @user.save
  end

end
