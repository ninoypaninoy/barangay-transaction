class CreateOfficials < ActiveRecord::Migration[5.0]
  def change
    create_table :officials do |t|
      t.string :official_first_name
      t.string :official_middle_name
      t.string :official_last_name
      t.string :official_position

      t.timestamps
    end
  end
end
