class Item < ApplicationRecord

    belongs_to :user 

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_cost
    belongs_to :shipping_area
    belongs_to :shipping_day

    validates :name, presence: true
    validates :text, presence: true
    validates :price, presence: true
    validates :image, presence: true
    validates :category_id, numericality: { other_than: 1, , message: "can't be blank" } 
    validates :condition_id, numericality: { other_than: 1, , message: "can't be blank" } 
    validates :shipping_cost_id, numericality: { other_than: 1, , message: "can't be blank" } 
    validates :shipping_area_id, numericality: { other_than: 1, , message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, , message: "can't be blank" }

end
