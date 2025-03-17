class EntriesController < ApplicationController

  def new
    @entry = Entry.new
    @entry.place_id = params["place_id"]
  end
  
  def create
    @entry = Entry.new
    @entry["title"] = params["entry"]["title"]
    @entry["description"] = params["entry"]["description"]
    @entry["occurred_on"] = params["entry"]["occurred_on"]
    @entry["place_id"] = params["entry"]["place_id"]
    @entry["user_id"] = @current_user.id if @current_user
    @entry.image.attach(params["entry"]["image"]) if params["entry"]["image"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
