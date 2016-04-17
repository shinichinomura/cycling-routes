class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @dest = Destination.find(params[:id])

    gon.current_location = session[:current_location]
  end
end
