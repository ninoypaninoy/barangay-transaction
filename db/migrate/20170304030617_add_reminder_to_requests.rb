class AddReminderToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :reminder, :string
  end
end
