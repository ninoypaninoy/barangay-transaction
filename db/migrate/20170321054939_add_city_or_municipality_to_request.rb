class AddCityOrMunicipalityToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :city_or_municipality, :string
  end
end
