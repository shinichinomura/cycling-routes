class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @dest = Destination.find(params[:id])
  end
end
