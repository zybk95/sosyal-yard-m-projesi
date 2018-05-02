class WelcomeController < ApplicationController
  def index
    @aids = Aid.all
    @hash = Gmaps4rails.build_markers(@aids) do |aid, marker|
      marker.lat aid.latitude
      marker.lng aid.longitude
      marker.infowindow aid.title
    end
  end
end
