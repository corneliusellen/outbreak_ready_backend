class Menu
  include ActiveModel::Serialization
  attr_reader :name, :data, :foods

  def initialize(info)
    @name = info["name"]
    @data = info["entries"]["items"]
    @foods = []
  end
end
