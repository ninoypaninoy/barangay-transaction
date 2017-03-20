class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.string :reminder_title
      t.string :reminder_content
      t.date :reminder_due

      t.timestamps
    end
  end
end
