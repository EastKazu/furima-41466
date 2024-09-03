class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_purchase_address = OrderPurchaseAddress.new
  end

  def new
    @order_purchase_address = OrderPurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase_address = OrderPurchaseAddress.new(order_params)
    if @order_purchase_address.valid?
      @order_purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_purchase_address).permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
