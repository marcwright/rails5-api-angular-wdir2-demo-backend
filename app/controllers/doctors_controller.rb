class DoctorsController < ApplicationController
  # GET /doctors
  def index
    doctors = Doctor.all

    render json: doctors
  end

  # GET /doctors/1
  def show
    doctor = Doctor.find(params[:id])
    render json: doctor
  end

  # POST /doctors
  def create
    doctor = Doctor.new(doctor_params)
    puts(doctor_params)

    if doctor.save
      render json: doctor, status: :created, location: doctor
    else
      render json: doctor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctors/1
  def update
    doctor = Doctor.find(params[:id])
    if doctor.update(doctor_params)
      render json: doctor
    else
      render json: doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    doctor = Doctor.find(params[:id])
    doctor.destroy

    render json: {status: 204}
  end

  private
    # Only allow a trusted parameter "white list" through.
    def doctor_params
      params.require(:doctor).permit(:name, :specialty, :insurance, :gender)
    end
end
