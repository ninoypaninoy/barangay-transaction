class AddBarangayToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :barangay, :string
  end
end
