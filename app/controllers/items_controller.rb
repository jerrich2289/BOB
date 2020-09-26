class ItemsController < ApplicationController
  def new
    @item = Item.new
  end


  # item-infoen kommer inn til create som innholdet inni params. 
  # Dette må så filtreres gjennom strong_params før det tildeles 
  # new_item. 
  def create
    @new_item = Item.new(strong_params)
    @new_item.owner = current_user
    @new_item.save!
    redirect_to items_path
  end

  def index
    @items = Item.all
  end

  def dummy
    # this one's just for making the card
    # component dummy site function
  end

  private

  def strong_params
    params.require(:item).permit(:name, :description, :photo)
  end

end
