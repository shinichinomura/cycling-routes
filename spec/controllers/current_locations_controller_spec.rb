require 'rails_helper'

RSpec.describe CurrentLocationsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it do
      post :create, suggested_address: "東京都渋谷区"

      expect(session[:current_location]).to eq('東京都渋谷区')
    end
  end
end
