class Product < ApplicationRecord
    validates :name, presence:true
    validates :description, presence:true
    validates :unit_price, presence:true
    validates :stock, presence:true
    validates :category, presence:true
    validates :size, presence:true
    validates :color, presence:true

    # Método para "eliminar" un producto lógicamente
    def soft_delete
        update(removal_date: Time.current) 
    end

    # Método para verificar si un producto está "eliminado"
    def deleted?
        removal_date.present?
    end
end
