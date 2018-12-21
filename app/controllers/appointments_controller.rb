class AppointmentsController < ApplicationController

  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.valid?
      @appointment.create
      redirect_to appointment_path(@appointment)
    else
      render new_appointment_path
    end
  end

  def show
  end

  def edit
  end

  def update
    test_validity = Appointment.new(appointment_params)
    if test_validity.valid?
      @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render edit_appointment_path
    end
  end

  def destroy
    @owner = @appointment.owner
    @appointment.destroy
    redirect_to owner_path(@owner)
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :pet_id, :sitter_id)
  end

end
