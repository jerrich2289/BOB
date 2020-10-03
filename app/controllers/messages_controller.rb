class MessagesController < ApplicationController

def create
    @trade = Trade.find(params[:trade_id])
    @message = Message.new(message_params)
    @message.trade = @trade
    @message.user = current_user

    if @message.save!
      redirect_to trade_path(@trade, anchor: "message-#{@message.id}")
    else
      render 'trades/show'
    end
end

  def message_params
    params.require(:message).permit(:message)
  end
end
