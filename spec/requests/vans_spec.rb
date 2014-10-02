require 'rails_helper'

RSpec.describe "Vans", :type => :request do
  describe "GET /vans" do
    it "works! (now write some real specs)" do
      get vans_path
      expect(response).to have_http_status(200)
    end
  end
end
