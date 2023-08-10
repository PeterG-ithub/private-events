class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    event_id = params[:event_id]
    @attendance = current_user.attendances.new(event_id: event_id)
    if Attendance.where.not(["event_id = ?", event_id]).present?
      flash[:notice] = "You've already joined this event."
      redirect_to root_path
    elsif @attendance.save
      flash[:notice] = 'Event added!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to create event!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end
