class DefaultController < ApplicationController
  def index
    redirect_to articles_url
  end

  def sitemap
    render :sitemap, content_type: 'application/xml'
  end
end
