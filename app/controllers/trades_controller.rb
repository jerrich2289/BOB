class TradesController < ApplicationController
  def new
    @all_items = current_user.items
    @user_item = @all_items.shuffle.first unless params[:item_id]
    @user_item ||= @all_items.find(params[:item_id])
    @bigger_item = Item.where("size >= ?",@user_item.size).where.not(owner_id: current_user.id).shuffle.first
    @better_item = Item.where("size <= ?",@user_item.size).where.not(owner_id: current_user.id).shuffle.first
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

