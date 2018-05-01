require "rails_helper"

RSpec.describe AidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/aids").to route_to("aids#index")
    end

    it "routes to #new" do
      expect(:get => "/aids/new").to route_to("aids#new")
    end

    it "routes to #show" do
      expect(:get => "/aids/1").to route_to("aids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/aids/1/edit").to route_to("aids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/aids").to route_to("aids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/aids/1").to route_to("aids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/aids/1").to route_to("aids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/aids/1").to route_to("aids#destroy", :id => "1")
    end

  end
end
