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

  describe "POST #clear" do
    before do
      session[:current_location] = '東京都渋谷区'
    end

    it do
      post :clear

      expect(session[:current_location]).to eq nil
    end
  end
end
