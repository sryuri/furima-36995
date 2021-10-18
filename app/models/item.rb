class Item < ApplicationRecord

    belongs_to :user 
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_cost
    belongs_to :shipping_area
    belongs_to :shipping_day
end
