require 'rails_helper'

RSpec.describe "Aids", type: :request do
  describe "GET /aids" do
    it "works! (now write some real specs)" do
      get aids_path
      expect(response).to have_http_status(200)
    end
  end
end
