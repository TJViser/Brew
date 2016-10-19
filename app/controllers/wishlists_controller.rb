class WishlistsController < ApplicationController
  before_filter :find_model

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new({ user_id: current_user.id, beer_id: params[:beer_id] })
    @wishlist.save
    redirect_to dashboard_path
  end


  private

  def find_model
    @model = Wishlist.find(params[:id]) if params[:id]
  end
end
