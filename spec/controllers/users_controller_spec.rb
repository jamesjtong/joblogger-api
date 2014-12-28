require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "index" do
    before { get :index }
    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "lists the user's public attributes while hiding the user's favorite_color" do
      response_keys = JSON.parse(response.body)["users"].first.keys
      expect(response_keys).to include("id")
      expect(response_keys).to include("name")
      expect(response_keys).to include("email")
      expect(response_keys).to_not include("favorite_color")
    end
  end


end
