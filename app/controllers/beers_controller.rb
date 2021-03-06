class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index         # GET /beers
    @beers = Beer.all
    @hash = Gmaps4rails.build_markers(@beers.map(&:user).uniq) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/beers/map_box", locals: { beer: beer })
    end
  end

  def show          # GET /beers/:id
    @beer = Beer.find(set_beer)
  end

  def new           # GET /beers/new
    @beer = Beer.new
  end

  def create        # POST /beers
    @beer = Beer.new(beer_params)
    @beer.user = current_user
    if @beer.save
      redirect_to beer_path(@beer), notice: 'Your beer was successfully added.'
    else
      render :new
    end

  end

  def edit          # GET /beers/:id/edit
    @beer = current_user.beers.find(set_beer.id)
  end

  def update        # PATCH /beers/:id
    @beer = current_user.beers.find(set_beer)
    @beer.update(beer_params)

    redirect_to beer_path(@beer), notice: 'Your beer was successfully updated.'

  end

  def destroy       # DELETE /beers/:id
  @beer = Beer.find(set_beer)
  @beer.destroy

  redirect_to dashboard_path, notice: 'Your beer was successfully destroyed.'

  end

private

  def set_beer
      @beer = Beer.find(params[:id])
    end

  def beer_params

    params.require(:beer).permit(:name, :price, :stock, :description,
      :alcohol, :category, :conditionning, :photo, :photo_cache)
  end

end
