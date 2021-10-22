class BuyAddress
    include ActiveModel::Model
    attr_accessor :zip_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id

    
    validates :zip_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :address, presence: true
    validate  :building_name
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :item_id, presence: true
    validates :user_id, presence: true

    def save   
        buy = Buy.create(item_id: item_id, user_id: user_id)
        Address.create(buy_id: buy.id, zip_code: zip_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
    end

end
