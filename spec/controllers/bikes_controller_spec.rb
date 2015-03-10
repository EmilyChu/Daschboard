require 'rails_helper'

describe BikesController do
  render_views # Since we want to look at the output of the JSON views

  before :each do
    @user = User.create! email: "test@example.com", password: "password"
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

  it "allows a user to favorite and unfavorite stations" do
    login @user

    get :favorites
    json = JSON.parse response.body
    expect(json.count).to eq 0

    patch :favorite, location: "10th & U St NW"
    expect(response.code).to eq "200"

    get :favorites
    json = JSON.parse response.body
    expect(json.count).to eq 1
    expect(json.first["location"]).to eq "10th & U St NW"

    patch :unfavorite, location: "10th & U St NW"
    expect(response.code).to eq "200"

    get :favorites
    json = JSON.parse response.body
    expect(json.count).to eq 0
  end

  it "requires login for favorites" do
    get :favorites
    expect(response.code).to eq "302"
  end

  it "ignores invalid favorite requests" do
    login @user

    patch :favorite, location: "Not an actual location"
    expect(response.code).to eq "200"

    get :favorites
    json = JSON.parse response.body
    expect(json.count).to eq 0
  end
end
