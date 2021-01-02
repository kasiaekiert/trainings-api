class RemoveAuthorFromMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :author, :string
  end
end
