class UsersController < ApplicationController
  before_filter :find_model

  def dashboard
    @my_wishes = current_user.wishlists
    @my_beers = current_user.beers
    @user = current_user

    # @wishes_on_my_beers = current_user.beers.whislists
  end

  def profile
    @user = User.find(params[:id])
  end

  private
  def find_model
    @model = User.find(params[:id]) if params[:id]
  end
end
