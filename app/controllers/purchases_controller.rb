class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_invalid_access, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_invalid_access
    return unless current_user.id == @item.user_id || @item.purchase.present?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
