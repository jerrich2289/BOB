class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @items = Item.all
  end

  def dummy
    # this one's just for making the card
    # component dummy site function
  end
end
