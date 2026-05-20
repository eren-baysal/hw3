class PlacesController < ApplicationController
  def index
    @list_of_places = Place.order({ :name => :asc })

    render({ :template => "places/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_place = Place.find_by({ :id => the_id })
    @list_of_entries = @the_place.entries.order({ :posted_on => :desc })

    render({ :template => "places/show" })
  end

  def new
    render({ :template => "places/new" })
  end

  def create
    the_place = Place.new
    the_place.name = params.fetch("query_name")

    if the_place.save
      redirect_to("/places")
    else
      redirect_to("/places/new")
    end
  end
end
