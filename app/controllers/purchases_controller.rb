class PurchasesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: item.id)
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name,
                                    :phone_number).merge(purchase_id: @purchase.id)
  end
end
