class AddProvinceOrCityToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :province_or_city, :string
  end
end
