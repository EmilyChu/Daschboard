require 'rails_helper'

describe BikesController do
  render_views # Since we want to look at the output of the JSON views

  before :each do
    @lat, @long = 38.8539240, -77.0491380
  end

  it "can get a list of nearby stations" do
    get :index, lat: @lat, long: @long

    json = JSON.parse response.body
    nearest = json.first

    expect(json.count).to eq 10
    expect(nearest.keys).to eq %w( location available open )
    expect(nearest["location"]).to eq "23rd & Crystal Dr"
  end
end
