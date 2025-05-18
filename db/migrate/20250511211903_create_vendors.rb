class CreateVendors < ActiveRecord::Migration[8.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :legalform
      t.string :contact
      t.string :address
      t.string :phone
      t.string :email
      t.string :taxnumber
      t.string :taxoffice
      t.date :last_visit
      t.string :visit_day

      t.timestamps
    end
  end
end
