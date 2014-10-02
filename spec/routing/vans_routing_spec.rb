require "rails_helper"

RSpec.describe VansController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vans").to route_to("vans#index")
    end

    it "routes to #new" do
      expect(:get => "/vans/new").to route_to("vans#new")
    end

    it "routes to #show" do
      expect(:get => "/vans/1").to route_to("vans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vans/1/edit").to route_to("vans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vans").to route_to("vans#create")
    end

    it "routes to #update" do
      expect(:put => "/vans/1").to route_to("vans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vans/1").to route_to("vans#destroy", :id => "1")
    end

  end
end
