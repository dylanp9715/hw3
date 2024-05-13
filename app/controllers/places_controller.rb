class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    # find a Place
    @place = Place.find_by({"id" => params["id"]})
    # render entries/show view with details about Place
    @entries = Entry.where({"place_id" => params["id"]})
  end

  def new
    # render view with new Place form
  end

  def create
    # start with a new Place
    @place = Place.new
    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]
    # save Place row
    @place.save
    # redirect user
    redirect_to "/places"
  end
end
