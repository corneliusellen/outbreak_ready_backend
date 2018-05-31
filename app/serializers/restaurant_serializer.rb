class RestaurantSerializer < ActiveModel::Serializer
  attributes :venue_id, :name, :address

  def address
    object.address
  end
end
