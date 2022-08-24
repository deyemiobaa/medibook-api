class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def new
    @reservations = Reservation.new
  end

  def create
    @reservations = Reservation.create(reservation_params)
    @reservations.user = current_user
    if @reservations.save
      redirect_to @reservations
    else
      render :new
    end
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservations).permit(:date, :duration, :total)
  end
end
