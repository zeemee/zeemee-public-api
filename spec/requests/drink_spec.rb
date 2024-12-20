require 'rails_helper'

RSpec.describe "Drinks", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/drink/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/drink/index"
      expect(response).to have_http_status(:success)
    end
  end

end
