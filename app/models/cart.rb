class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items
    
    def cart_total
        total=0
        self.cart_items.each do |item|
            total+=item.price_total
        end
        return total
    end

    def taxes_total
        taxes_total=0
        self.cart_items.each do |item|
            if item.tax_total
                taxes_total+=item.tax_total
            end
        end
        taxes_total
    end

end
