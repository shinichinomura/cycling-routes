class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
  end
end
