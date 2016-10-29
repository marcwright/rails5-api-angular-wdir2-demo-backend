class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  def get_all
    doctors = Doctor.all
    appointments = Appointment.all
    patients = Patient.all
    all_data = {patients: patients, doctors: doctors, appointments: appointments}
    render json: all_data
  end

  # GET /appointments
  def index
    @appointments = Appointment.all

    render json: @appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    puts(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.fetch(:appointment, {}).permit(:location, :day, :reason, :doctor_id, :patient_id)
    end
end
