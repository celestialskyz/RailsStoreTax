class Product < ApplicationRecord
    validates :name, uniqueness:true
    has_many :line_items, dependent: :destroy
end
