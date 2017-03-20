class AddBirthdayToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :birthday, :date
  end
end
