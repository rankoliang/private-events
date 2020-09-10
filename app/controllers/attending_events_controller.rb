class AttendingEventsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event.attended_events.create(attendee: current_user)

    render 'events/show', locals: { :@event => event }
  end
end
