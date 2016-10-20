class UsersController < ApplicationController
  before_filter :find_model
  skip_before_action :authenticate_user!, only: :profile

  def dashboard
    @my_wishes = current_user.wishlists
    @my_beers = current_user.beers
    @user = current_user

    # @wishes_on_my_beers = current_user.beers.whislists
  end

  def profile
    @user = User.find(params[:id])
    @alert_message = "You are viewing #{@user.first_name}"
    @user_coordinates = { lat: @user.latitude, lng: @user.longitude }
  end


  def edit_profile
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_profile_path(current_user)
  end


  private
  def find_model
    @model = User.find(params[:id]) if params[:id]
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :bio, :beer_brand, :city)
  end
end
