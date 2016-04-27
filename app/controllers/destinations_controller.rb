class DestinationsController < ApplicationController
  def show
    @dest = Destination.find(params[:id])

    gon.current_location = session[:current_location]
  end
end
