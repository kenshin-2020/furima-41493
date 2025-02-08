class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      logger.debug '✅ PurchaseAddress is valid!'
      @purchase_address.save
      redirect_to root_path
    else
      logger.debug "❌ PurchaseAddress is invalid: #{@purchase_address.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name,
                  :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
