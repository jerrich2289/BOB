class TradesController < ApplicationController
  def new
    @user_item = Item.all.shuffle.first
    @bigger_item = Item.where("size >= ?",@user_item.size).shuffle.first
    @better_item = Item.all.shuffle.first
    @trade = Trade.new(item_1: @user_item, item_2: @bigger_item)
  end

  def create
    Trade.create!(trade_params)
    redirect_to new_trade_path
  end

  def trade_params
    params.require(:trade).permit(:item_1_id, :item_2_id)
  end
end

