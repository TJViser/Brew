class WishlistsController < ApplicationController
  before_filter :find_wishlist

  def new
    @beer = Beer.find(params[:beer_id])
    @wishlist = Wishlist.new
  end

  def create
    if params[:user]
      @user = current_user
      @user.update(address: params[:user][:address], cp: params[:user][:cp], city: params[:user][:city], country: params[:user][:country])
    end

    @wishlist = Wishlist.new({ user_id: current_user.id, beer_id: params[:beer_id], quantity: 1 })
    @beer = Beer.find(id = params[:beer_id])
    @beer.stock -= 1
    @beer.save
    @wishlist.save
    redirect_to dashboard_path
  end

  def send_beer
    @wishlist = Wishlist.find(params[:wishlist_id])
    @wishlist.send
  end

  private

  def find_wishlist
    @wishlist = Wishlist.find(params[:id]) if params[:id]
  end
end
