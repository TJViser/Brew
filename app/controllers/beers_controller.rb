class BeersController < ApplicationController

  def index         # GET /beers
    @beers = Beer.all
  end

  def show          # GET /beers/:id
    @beer = Beer.find(params[:id])
  end

  def new           # GET /beers/new
    @beer = Beer.new
  end

  def create        # POST /beers
    @beer = Beer.new(beer_params)
    @beer.user = current_user
    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new
    end

  end

  def edit          # GET /beers/:id/edit
    @beer = Beer.find(params[:id])
  end

  def update        # PATCH /beers/:id
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)

    redirect_to beer_path(@beer)

  end

  def destroy       # DELETE /beers/:id
  @beer = Beer.find(params[:id])
  @beer.destroy

  redirect_to beer_path

  end

private

  def beer_params
    params.require(:beer).permit(:name, :price, :stock, :description,
      :alcohol, :category, :conditionning, :photo, :photo_cache)
  end

end
