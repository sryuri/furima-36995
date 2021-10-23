class BuysController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

    def index
        @buy_address = BuyAddress.new
        if @item.user_id == current_user.id
          redirect_to root_path
        end 
        if  @item.buy.present?
          redirect_to root_path
         end  
    end

    def create
        @buy_address  = BuyAddress.new(buy_address_params)
        if @buy_address.valid?
           pay_item
           @buy_address.save
           redirect_to root_path
        else
           render "buys/index"
        end
    end   
    

    private

    def buy_address_params
      params.require(:buy_address).permit(:zip_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
          amount: @item.price,  
          card: buy_address_params[:token],         
          currency: 'jpy'                 
      )
    end     
    
    def set_item
      @item = Item.find(params[:item_id]) 
    end
end
