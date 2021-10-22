class BuysController < ApplicationController

  before_action :authenticate_user!, only: [:index]

    def index
        @buy_address = BuyAddress.new
        @item = Item.find(params[:item_id])
        if @item.user_id == current_user.id
          redirect_to root_path
        end 
    end

    def create
        @item = Item.find(params[:item_id])
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
      params.require(:buy_address).permit(:zip_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end

end
