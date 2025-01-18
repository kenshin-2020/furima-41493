class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :situation_id, :shippingfee_id, :prefecture_id,
                                 :deliveryday_id, :price, :image).merge(user_id: current_user.id)
  end
end
