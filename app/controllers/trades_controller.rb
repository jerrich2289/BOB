class TradesController < ApplicationController
  def new
    @user_item = Item.all.shuffle.first
    @bigger_item = Item.all.shuffle.first
    @better_item = Item.all.shuffle.first
  end

end
