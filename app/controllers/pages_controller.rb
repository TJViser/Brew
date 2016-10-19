class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @beers = Beer.take(4)
  end
end
