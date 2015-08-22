class Api::V1::ReservationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    page = params[:page]
    @reservations = Reservation.page(page)
    render json: { reservations:
      @reservations.as_json(only: [:restaurant_name, :place, :time_of_reservation,
       :proposition, :guests_number_pref, :gender_pref, :liquor_pref],
       include: { user: { only: [:id, :name] } }) }
  end

  def create
    user = User.find(params[:user_id])
    reservation = user.reservations.create(reservation_params)
    if reservation
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
