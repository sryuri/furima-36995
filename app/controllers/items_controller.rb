class ItemsController < ApplicationController

    before_action :set_item, only: [:show, :edit, :update]
    before_action :authenticate_user!, only: [:new, :edit, :destroy]
    
    def index
        @items = Item.order("created_at DESC")
        
    end

    def new
        @item = Item.new   
    end    

    def create
        @item = Item.new(item_params)
        if @item.save
           redirect_to root_path
        else
           render :new
        end
    end   

    def show
        
    end

    def edit
        unless @item.user_id == current_user.id
            redirect_to root_path and return
        end
        if  @item.buy.present?
            redirect_to root_path
        end  
    end

    def update
         if @item.update(item_params)
            redirect_to item_path
         else
            render :edit
         end
    end  
    
    def destroy
        item = Item.find(params[:id])
        if item.user_id == current_user.id
           item.destroy
           redirect_to root_path
        else
           redirect_to root_path   
        end    
    end
        
    
    private

    def item_params
      params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
    end 

    def set_item
        @item = Item.find(params[:id]) 
    end
    
end
