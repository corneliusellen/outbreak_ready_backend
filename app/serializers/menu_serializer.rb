class MenuSerializer < ActiveModel::Serializer
  attributes :name, :foods

  def foods
    object.foods.flatten
  end
end
