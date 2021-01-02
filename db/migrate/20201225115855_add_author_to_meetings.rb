class AddAuthorToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :author
  end
end
