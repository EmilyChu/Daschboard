require 'rails_helper'

describe BikeStation do
  before :each do
    @lat, @long = 38.8539240, -77.0491380
  end

  it "can look up by geo location" do
    near = BikeStation.closest_to lat: @lat, long: @long, limit: 25
    nearest = near.first

    expect(near.count).to eq 25
    expect(nearest.location).to eq "23rd & Crystal Dr"
    expect(nearest.available).to be >= 0
    expect(nearest.open).to be >= 0
  end

  it "can limit hits by radius" do
    near = BikeStation.closest_to lat: @lat, long: @long, radius: 0.5, limit: 25
    farthest = near.last

    expect(near.count).to be < 15
    expect(farthest.distance_to @lat, @long).to be <= 0.5
  end
end
