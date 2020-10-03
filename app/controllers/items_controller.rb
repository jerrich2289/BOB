class ItemsController < ApplicationController
  before_action :show_navbar, only: [:new, :show, :index]

  def new
    @item = Item.new
  end

  def create
    @new_item = Item.new(strong_params)
    @new_item.owner = current_user
    @new_item.save!
    redirect_to items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.owner_id)
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
