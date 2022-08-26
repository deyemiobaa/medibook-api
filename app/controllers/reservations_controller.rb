class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.find_by_sql(
      "SELECT reservations.id as id, doctors.name, reservations.total, reservations.duration, reservations.date
      FROM reservations INNER JOIN doctors ON reservations.doctor_id = doctors.id
      WHERE reservations.user_id = #{current_user.id}"
    )
    render json: @reservations
  end

  def create
    @reservations = Reservation.new(reservation_params)
    @reservations.user = current_user
    if @reservations.save
      render json: { message: 'reservation created', status: :created }
    else
      render json: @reservations.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private

  def reservation_params
    params.permit(:date, :duration, :total, :doctor_id)
  end
end
