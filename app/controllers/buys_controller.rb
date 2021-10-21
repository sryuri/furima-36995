class BuysController < ApplicationController

    def index
        @buy_address = BuyAddress.new
    end

    def create
        @buy_address  = BuyAddress.new(buy_address_params)
        if @buy_address.valid?
          @buy_address.save
          redirect_to root_path
        else
          render "buys/index"
        end
    end   


    private

    def buy_address_params
      params.require(buy_address).permit(:zip_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id, :buy_id).merge(user_id: current_user.id)
    end

end
