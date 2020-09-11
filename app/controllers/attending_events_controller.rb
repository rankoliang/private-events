class AttendingEventsController < ApplicationController
  def new
    @users = User.where(
      'id NOT IN (:attendees)',
      attendees: User.select(:id).joins(:attended_events).where('attended_events.event_id = ?', params[:event_id])
    )
    @event_id = params[:event_id]
  end

  def create
    action = request.path.split('/').last
    event = Event.find(params[:event_id])
    if action == 'attend'
      accepted = true
      attendee_id = current_user.id
    elsif action == 'invite'
      accepted = false
      attendee_id = params[:user_id]
    end
    event.attended_events.create(attendee_id: attendee_id, accepted: accepted)

    render 'events/show', locals: { :@event => event }
  end
end
