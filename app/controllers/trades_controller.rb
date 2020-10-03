class TradesController < ApplicationController
  before_action :show_navbar, only: [:new]

  def new
    @all_items = current_user.items
    @user_item = @all_items.shuffle.first unless params[:item_id]
    @user_item ||= @all_items.find(params[:item_id])
    @bigger_item = Item.where("size >= ?",@user_item.size).where.not(owner_id: current_user.id).shuffle.first
    @better_item = Item.where("size <= ?",@user_item.size).where.not(owner_id: current_user.id).shuffle.first
    @trade = Trade.new(item_1: @user_item, item_2: @bigger_item)
  end

  def create
    if exists = Trade.find_by(trade_params_reversed)
      # this one means the trade has already been swiped true by the other item's user
      # this one should mark the trade as matched and redirect to the match page
      exists.update(matched: true)
      redirect_to #the chat branch
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
  end
  
  private

  def trade_params
    params.require(:trade).permit(:item_1_id, :item_2_id)
  end

  def trade_params_reversed
    {item_1_id: trade_params[:item_2_id], item_2_id: trade_params[:item_1_id]}
  end

end

