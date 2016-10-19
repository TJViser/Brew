class BeersController < ApplicationController

  def index         # GET /beers
    @beers = Beer.all
  end

  def show          # GET /beers/:id
    @beer = Beer.find(set_beer)
  end

  def new           # GET /beers/new
    @beer = Beer.new
  end

  def create        # POST /beers
    @beer = Beer.new(beer_params)
    @beer.save

    redirect_to beer_path(@beer)

  end

  def edit          # GET /beers/:id/edit
    @beer = Beer.find(set_beer)
  end

  def update        # PATCH /beers/:id
    @beer = Beer.find(set_beer)
    @beer.update(beer_params)

    redirect_to beer_path(@beer)

  end

  def destroy       # DELETE /beers/:id
  @beer = Beer.find(set_beer)
  @beer.destroy

  redirect_to beer_path

  end

private

  def set_beer
      @beer = Beer.find(params[:id])
    end

  def beer_params
    params.require(:beers).permit(:user, :name, :price, :stock, :description,
      :alcohol, :type, :conditionning, :photo, :photo_cache)
  end

end
