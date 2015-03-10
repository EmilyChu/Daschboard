class MetrosController < ApplicationController
  def favorite
    metro = MetroStation.where(name: params[:station]).first!
    current_user.favorite_metros.push metro
    head :ok
  end

  def unfavorite
    metro = MetroStation.where(name: params[:station]).first!
    current_user.favorite_metros.where(metro: metro).delete_all
    head :ok
  end
end
