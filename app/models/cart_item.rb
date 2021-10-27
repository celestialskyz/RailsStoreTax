class CartItem < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    def total 
        (self.quantity * self.product.price).round(2)
    end

    def price_total
        total+tax_total
    end

    def tax_total
        total = (self.quantity * self.product.price).round(2)
        basic_tax=0
        import_tax=0
        if self.product.hasBasicTax
            basic_tax = round_to_fives((total *0.1).round(2)) || 0
        end
        if self.product.isImported
            import_tax = round_to_fives((total *0.05).round(2)) || 0
        end
        return import_tax+basic_tax
    end

    private
    def round_to_fives(tax) #.38
        extra =0
        trailingcents= (tax%1)*100  #38
        lastcent = trailingcents%10
        if trailingcents%5 !=0
            if (trailingcents > 5)
                extra = (10-lastcent)/100
            else
                extra = (5-lastcent)/100 
            end
        end
        extra = extra.round(2)
        return tax+extra
    end

end
