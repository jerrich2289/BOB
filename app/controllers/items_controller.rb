class ItemsController < ApplicationController
  before_action :show_navbar, only: [:new, :show, :index]

  def new
    @new_item = Item.new
  end

  def create
    @new_item = Item.new(strong_params)
    @new_item.owner = current_user
    @new_item.save
    if @new_item.save
      redirect_to new_trade_path(item_id: @new_item.id)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.owner_id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy!
    redirect_to '/items', :notice => "Your item has been deleted"
  end

  def dummy
    # this one's just for making the card
    # component dummy site function
  end

  private

  def strong_params
    params.require(:item).permit(:name, :description, :size, photos: [])
  end

end
