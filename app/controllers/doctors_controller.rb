class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: { message: 'Doctor profile added successfully' }, status: :created
    else
      render json: { message: 'Sorry, this action could not be completed, Try again.' }, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/id
  def destroy
    if @doctor.destroy
      render json: { message: 'Doctor profile deleted', status: :ok }
    else
      render json: { message: 'Doctor profile not found'}, status: :not_found
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :available_times, :hourly_rate, :picture)
  end
end
