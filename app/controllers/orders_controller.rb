class OrdersController < ApplicationController
  before_action :move_to_sign_in, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: :index

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_purchase_address = OrderPurchaseAddress.new
  end

  def create
    @order_purchase_address = OrderPurchaseAddress.new(order_params)
    if @order_purchase_address.valid?
      pay_item
      @order_purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_purchase_address)
          .permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_top
    return if user_signed_in? && @item.user != current_user && !@item.order.present?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
