class Api::V1::Search::RestaurantsController < ApplicationController

  def index
    restaurants = RestaurantService.new(params[:near], params[:query]).run
    if restaurants.empty?
      render json: {message: "No restaurants found for your search"}
    else
      render json: restaurants, each_serializer: RestaurantSerializer
    end
  end
end
