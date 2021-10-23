class Item < ApplicationRecord

    belongs_to :user 
    has_one :buy
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_cost
    belongs_to :shipping_area
    belongs_to :shipping_day

    validates :name, presence: true
    validates :text, presence: true
    validates :image, presence: true
    validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
    
end
