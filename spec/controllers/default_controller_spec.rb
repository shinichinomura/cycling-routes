require 'rails_helper'

RSpec.describe DefaultController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to redirect_to(articles_url)
    end
  end
end
