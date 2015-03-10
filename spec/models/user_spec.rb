require 'rails_helper'

describe User do
  before :each do
    @user = User.create! email: "test@example.com", password: "password"
  end

  it "has favorite bike stations" do
    expect(@user.favorite_bike_stations).to be_empty

    @user.track_bike_station "Massachusetts Ave & Dupont Circle NW"
    expect(@user.favorite_bike_stations.length).to eq 1

    @user.untrack_bike_station "Massachusetts Ave & Dupont Circle NW"
    expect(@user.favorite_bike_stations).to be_empty
  end

  it "silently rejects invalid favorites" do
    @user.track_bike_station "Massachusetts Ave & Dupont Circle NW"

    expect do
      @user.track_bike_station "Not a thing"
      @user.untrack_bike_station "Also not a thing"
      @user.untrack_bike_station "7th & T St NW"
    end.not_to raise_error

    expect(@user.favorite_bike_stations.first.location).to eq "Massachusetts Ave & Dupont Circle NW"
  end
end
