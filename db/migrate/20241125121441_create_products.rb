class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price
      t.integer :stock
      t.text :images
      t.string :category
      t.string :size
      t.string :color
      t.datetime :removal_date

      t.timestamps
    end
  end
end
