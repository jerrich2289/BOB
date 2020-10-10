class TradesController < ApplicationController
  before_action :show_navbar, only: [:index, :show]

  def new
    return redirect_to items_path if current_user.items.empty?
    @all_items = current_user.items
    @user_item = @all_items.shuffle.first unless params[:item_id]
    @user_item ||= @all_items.find(params[:item_id])
    @bigger_item = Item.where("size >= ?",@user_item.size).where.not(owner_id: current_user.id).shuffle.first
    @better_item = Item.where("size <= ?",@user_item.size).where.not(owner_id: current_user.id).shuffle.first
    @bigger_trade = Trade.new(item_1: @user_item, item_2: @bigger_item)
    @better_trade = Trade.new(item_1: @user_item, item_2: @better_item)
  end

  def create
    if exists = Trade.find_by(trade_params_reversed)
      exists.update(matched: true)
      redirect_to trades_path
      return #nil
    end
    unless Trade.find_by(trade_params) #find_or_create_by!
      Trade.create!(trade_params)
    end
    redirect_to new_trade_path
  end

  
  def show
    @trade = Trade.find(params[:id])
    @message = Message.new
  end
  
  def index
    @trades = current_user.trades
  end
  
  private

  def trade_params
    params.require(:trade).permit(:item_1_id, :item_2_id)
  end

  def trade_params_reversed
    {item_1_id: trade_params[:item_2_id], item_2_id: trade_params[:item_1_id]}
  end

end

