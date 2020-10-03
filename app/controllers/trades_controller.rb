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
    @chatroom = Chatroom.find(params[:chatroom_id])
    @messages = Message.new(message_params)
    @messages.chatroom = @chatroom
    @messages.user = current_user

    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'trades/show'
    end
  end

  def show
    @trade = Trade.find(params[:id])
    @message = Message.new
  end

  def index
  end

  def trade_params
    params.require(:trade).permit(:item_1_id, :item_2_id)
  end

  def message_params
    pararms.require(:message).permit(:content)
  end

end

