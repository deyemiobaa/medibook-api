class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.includes(:user).where(user_id: current_user.id)
    render json: @reservations
  end

  def new
    @reservations = Reservation.new
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

  def show
    @reservations = Reservation.find(params[:id])
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
