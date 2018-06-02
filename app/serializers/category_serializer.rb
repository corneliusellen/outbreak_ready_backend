class CategorySerializer < ActiveModel::Serializer
  attributes :name, :tags

  def tags
    object.tags
  end
end
