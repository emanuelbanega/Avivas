class Product < ApplicationRecord
    validates :name, presence:true
    validates :description, presence:true
    validates :unit_price, presence:true
    validates :stock, presence:true
    validates :category, presence:true
    validates :size, presence:true
    validates :color, presence:true
end
