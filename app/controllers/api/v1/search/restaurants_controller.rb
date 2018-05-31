class Api::V1::Search::RestaurantsController < ApplicationController

  def index
    restaurants = RestaurantService.new(params[:near], params[:query]).run
    render json: restaurants, each_serializer: RestaurantSerializer
  end
end
