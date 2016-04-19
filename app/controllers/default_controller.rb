class DefaultController < ApplicationController
  def index
    redirect_to destinations_url
  end
end
