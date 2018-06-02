class Api::V1::Search::MenusController < ApplicationController

  def index
    menus = MenuService.new(params[:venue_id]).run
    render json: menus, each_serializer: MenuSerializer
  end
end
