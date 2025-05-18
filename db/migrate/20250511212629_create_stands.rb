class CreateStands < ActiveRecord::Migration[8.0]
  def change
    create_table :stands do |t|
      t.decimal :width
      t.decimal :height
      t.decimal :depth
      t.decimal :diameter
      t.text :description
      t.integer :cooler
      t.integer :table
      t.boolean :selfdriver
      t.boolean :trailer
      t.boolean :power
      t.text :specials
      t.text :misc
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
