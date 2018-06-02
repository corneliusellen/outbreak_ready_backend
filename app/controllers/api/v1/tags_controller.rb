class Api::V1::TagsController < ApplicationController

  def index
    categories = Category.where.not(name: "Universal")
    render json: categories
  end
end
