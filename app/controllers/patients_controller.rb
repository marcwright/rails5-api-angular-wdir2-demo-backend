class PatientsController < ApplicationController
  # GET /patients
  def index
    patients = Patient.all

    render json: patients
  end

  # GET /patients/1
  def show
    patient = Patient.find(params[:id])
    render json: patient
  end

  # POST /patients
  def create
    patient = Patient.new(patient_params)
    puts(patient_params)

    if patient.save
      render json: patient, status: :created, location: patient
    else
      render json: patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  def update
    patient = Patient.find(params[:id])
    if patient.update(patient_params)
      render json: patient
    else
      render json: patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    render json: {status: 204}
  end

  private
    # Only allow a trusted parameter "white list" through.
    def patient_params
      params.require(:patient).permit(:name, :new_patient, :insurance_co, :gender)
    end
end
