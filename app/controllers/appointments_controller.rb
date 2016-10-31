class AppointmentsController < ApplicationController

  def get_all
    doctors = Doctor.all
    appointments = Appointment.all
    patients = Patient.all
    all_data = {patients: patients, doctors: doctors, appointments: appointments}
    render json: all_data
  end

  # GET /appointments
  def index
    appointments = Appointment.all

    render json: appointments
  end

  # GET /appointments/1
  def show
    appointment = Appointment.find(params[:id])
    render json: appointment
  end

  # POST /appointments
  def create
    appointment = Appointment.new(appointment_params)
    puts(appointment_params)

    if appointment.save
      render json: appointment, status: :created, location: appointment
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    appointment = Appointment.find(params[:id])
    if appointment.update(appointment_params)
      render json: appointment
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    render json: {status: 204}
  end

  private

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:location, :day, :reason, :doctor_id, :patient_id)
    end
end
