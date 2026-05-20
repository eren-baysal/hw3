class EntrieController < ApplicationController
  def new
    the_place_id = params.fetch("place_id")
    @the_place = Place.find_by({ :id => the_place_id })

    render({ :template => "entries/new" })
  end

  def create
    the_entry = Entry.new
    the_entry.title = params.fetch("query_title")
    the_entry.description = params.fetch("query_description")
    the_entry.posted_on = params.fetch("query_posted_on")
    the_entry.place_id = params.fetch("query_place_id")

    if the_entry.save
      redirect_to("/places/#{the_entry.place_id}")
    else
      redirect_to("/entries/new?place_id=#{the_entry.place_id}")
    end
  end
end
