class appointmentsController < ApplicationController
  def index
    @appointments = appointment.find_by_sql(
      "SELECT appointments.id as id, doctors.name, appointments.total, appointments.duration, appointments.date
      FROM appointments INNER JOIN doctors ON appointments.doctor_id = doctors.id
      WHERE appointments.user_id = #{current_user.id}"
    )
    render json: @appointments
  end

  def create
    @appointments = appointment.new(appointment_params)
    @appointments.user = current_user
    if @appointments.save
      render json: { message: 'appointment added', status: :created }
    else
      render json: {message: 'appointment not created'}, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = appointment.find(params[:id])
    if @appointment.destroy
      render json: { message: 'appointment deleted', status: :ok }
    else
      render json: { message: 'appointment not found', status: :not_found }
    end
  end

  private

  def appointment_params
    params.permit(:date, :duration, :doctor_id)
  end
end
