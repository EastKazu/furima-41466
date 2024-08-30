class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: :new
  before_action :set_item, only: [:edit, :show, :update, :move_to_index]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :shipping_day_id, :price, :user)
  end

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if user_signed_in? && current_user.id == @item.user.id

    redirect_to action: :index
  end
end
