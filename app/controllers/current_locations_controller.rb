class CurrentLocationsController < ApplicationController
  def new
  end

  def create
    session[:current_location] = params[:suggested_address]
  end

  def clear
    session[:current_location] = nil
  end
end
