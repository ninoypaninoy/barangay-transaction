class AddProvinceToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :province, :string
  end
end
