class AddAcceptedIndexToAttendedEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :attended_events, :accepted
    add_index :attended_events, %i[event_id attendee_id], unique: true, name: 'by_attendee_and_event'
  end
end
