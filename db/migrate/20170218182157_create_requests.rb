class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :request
      t.string :business_name
      t.string :business_type
      t.string :business_address
      t.string :line_of_business
      t.integer :business_contact
      t.string :business_month_started
      t.integer :business_day_started
      t.integer :business_years_operation
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.string :residence_type
      t.integer :transient_since
      t.string :bhouse_owner
      t.string :address
      t.string :contact_no
      t.string :gender
      t.string :status
      t.string :birth_month
      t.integer :birth_day
      t.integer :birth_year
      t.string :birth_place
      t.decimal :gross_income
      t.decimal :height
      t.decimal :weight
      t.string :blood_type
      t.string :occupation
      t.decimal :monthly_income
      t.string :purpose
      t.string :emergency_contact_person
      t.string :relationship
      t.string :contact_no_2
      t.string :place_issue
      t.integer :cci2010
      t.string :citizenship
      t.decimal :height
      t.decimal :weight
      t.decimal :basic_tax
      t.decimal :additional_tax
      t.decimal :salary
      t.decimal :salary_tax
      t.decimal :interest
      t.decimal :total_amount

      t.timestamps
    end
  end
end
