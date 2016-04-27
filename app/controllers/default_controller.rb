class DefaultController < ApplicationController
  def index
    redirect_to destinations_url
  end

  def sitemap
    render :sitemap, content_type: 'application/xml'
  end
end
