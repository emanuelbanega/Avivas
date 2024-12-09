class AddNullFalseToProductFields < ActiveRecord::Migration[8.0]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :description, false
    change_column_null :products, :unit_price, false
    change_column_null :products, :stock, false
    change_column_null :products, :category, false
    change_column_null :products, :size, false
    change_column_null :products, :color, false
  end
end
