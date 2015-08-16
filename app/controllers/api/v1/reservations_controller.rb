class Api::V1::ReservationsController < ApplicationController
  def index
    page = params[:page]
    reservations = Reservation.includes(:comments, :user).page(page)
    render json: { reservations: Reservation.as_json(reservations) }
  end

  def create
    user = User.find(params[:user_id])
    reservation = user.reservations.new(reservation_params)
    if reservation.save
      render json: { reservation: reservation }
    else
      render json: { message: "Reservation creation failed" }
    end
  end


  private

  def reservation_params
  	params.require(:reservation)
      .permit(:restaurant_name, :place, :time_of_reservation, :proposition,
              :guests_number_pref, :gender_pref, :liquor_pref)
  end
end
