class AddAcceptedToAttendedEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :attended_events, :accepted, :boolean, default: false
  end
end
